lib_folder = File.join(File.dirname(__FILE__), "lib")
$LOAD_PATH.unshift(lib_folder) unless $LOAD_PATH.include?(lib_folder)
require "mongoid"
require "sinatra"
require "sinatra/json"
require "sinatra/cross_origin"
require "financial_control"

configure do
  enable :cross_origin
end

set :allow_origin, :any
set :allow_methods, [:get, :post, :put, :options, :head]
set :expose_methods, ["Content-Type"]
set :protection, false

Mongoid.load!(File.join(File.dirname(__FILE__), "config/mongoid.yml"))

get "/outgoing" do
  date = Time.at(params[:timestamp].to_i)
  # json FinancialControl::Outgoing.where(date: date)
  json FinancialControl::Outgoing.all
end

post "/outgoing" do
  date = Time.at(params[:timestamp].to_i)
  outgoing_params = {
    date: date,
    description: params[:description],
    payment_method: params[:payment_method]
  }

  outgoing = FinancialControl::Outgoing.new(outgoing_params)

  if outgoing.save
    json msg: "success", error: false
  else
    halt 400, "Fail to create outgoing"
  end
end
