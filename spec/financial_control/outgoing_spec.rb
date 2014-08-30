require "financial_control/document/outgoing"

describe FinancialControl::Outgoing do
  before :each do
    @date = Date.new
    @outgoing = FinancialControl::Outgoing.new(
      date: @date, description: "haircut", payment_method: "debit")
  end

  it "should have Mongoid::Document included" do
    expect(FinancialControl::Outgoing.include?(Mongoid::Document)).to be true
  end

  it "should have date, description and payment_method attr" do

    expect(@outgoing.date).to eq @date
    expect(@outgoing.description).to eq "haircut"
    expect(@outgoing.payment_method).to eq "debit"
  end

  it "should respond to save message" do
    expect(@outgoing).to respond_to(:save)
  end
end
