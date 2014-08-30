require "mongoid"

module FinancialControl
  class Outgoing
    include Mongoid::Document

    field :date,           type: Date
    field :description,    type: String
    field :payment_method, type: String
  end
end
