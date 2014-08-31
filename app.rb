$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
require "mongoid"
require "sinatra"
require "sinatra/param"
require "sinatra/json"
require "sinatra/cross_origin"
require "financial_control"

configure do
  enable :cross_origin
end

Mongoid.load!(File.join(File.dirname(__FILE__), "config/mongoid.yml"))

get %r{/outgoing/(\d{4})/(\d{2})/(\d{2})} do |year, month, day|
  date = Date.new(year.to_i, month.to_i, day.to_i)
  json FinancialControl::Outgoing.where(date: date)
end

post "/outgoing" do
  outgoing = FinancialControl::Outgoing.new(params)

  if outgoing.save
    json msg: "success", error: false
  else
    halt 400, "Fail to create outgoing"
  end
end
