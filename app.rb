require "sinatra"
require "sinatra/cross_origin"
require "mongoid"

configure do
  enable :cross_origin
end

Mongoid.load!(File.join(File.dirname(__FILE__), "config/mongoid.yml"))

get "/" do
  "haraw"
end
