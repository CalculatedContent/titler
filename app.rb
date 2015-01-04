#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'redis'


configure do
  REDIS = Redis.new
end


get '/hello' do
  REDIS['hello']='hi ya from redis'
  REDIS['hello']
end


get "/" do
  "Calculated Content Titler"
end



