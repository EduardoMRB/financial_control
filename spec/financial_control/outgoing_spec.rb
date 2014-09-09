require "financial_control/document/outgoing"

describe FinancialControl::Outgoing do
  let(:outgoing) { FinancialControl::Outgoing.new(args) }
  let(:args) { { date: Date.new, description: "haircut", payment_method: "Debit" } }

  it "should have Mongoid::Document included" do
    expect(FinancialControl::Outgoing.include?(Mongoid::Document)).to be true
  end

  it "should have date, description and payment_method attr" do
    Timecop.freeze do
      expect(outgoing.date).to eq Date.new
      expect(outgoing.description).to eq "haircut"
      expect(outgoing.payment_method).to eq "Debit"
    end
  end

  it "should respond to save message" do
    expect(outgoing).to respond_to(:save)
  end

  it "should have default date value" do
    Timecop.freeze do
      outgoing = FinancialControl::Outgoing.new(
        description: "Desc", payment_method: "Credit")

      expect(outgoing.date).to eq Date.new
    end
  end

  it "should validate presence of description and payment_method" do
    outgoing = FinancialControl::Outgoing.new
    expect(outgoing).to_not be_valid

    outgoing.description = "Desc"
    expect(outgoing).to_not be_valid

    outgoing.payment_method = "Credit"
    expect(outgoing).to be_valid
  end
end
