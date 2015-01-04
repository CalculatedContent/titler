#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'


configure do
  REDIs = Redis.new
end

get "/" do
  "Calculated Content Titler"
end



