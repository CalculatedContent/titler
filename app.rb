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


# http://xxx.xxx.xxx.xx:3456/score?="this is a tweet"
get "/score" do
  tweet = params[:tweet]
  "the tweet to score is #{tweet}"

  # we just need to load the scores
  #
  # toks = tweet.downcase.split
  # vals = toks.map { |x|  REDIS["score:#{x}"] }
  # vals.compact!
  # vals.map! { |x| x.to_f }
  
  # sum = vals.inject{|sum,x| sum + x }
  # norm = vals.to_size.to_f

  # score = sum / norm
  
end






