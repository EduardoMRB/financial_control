require "mongoid"

module FinancialControl
  class Outgoing
    include Mongoid::Document

    field :date,           type: Date, default: -> { Date.new }
    field :description,    type: String
    field :payment_method, type: String

    validates :description, :payment_method, presence: true
  end
end
