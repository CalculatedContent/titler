#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'redis'
require 'json'

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
get "/test" do
  tweet = params[:tweet]

  result = {}
  result[:tokens]=[]

  toks = tweet.downcase.split
  toks.each do |x|
      result[:tokens] << { :token => x, score: 0.85  }
  end

  result[:totalScore]=0.59

  return result.to_json
end


# very crude
get "/score" do
  tweet = params[:tweet]

  result = {}
  result[:tokens]=[]

  sum = 0.0
  toks = tweet.downcase.split
  toks.each do |x|  
    s = REDIS["#{x}"].to_f
    sum += s 
    result[:tokens] << { :token => x, score: s  }
  end

  norm = toks.size.to_f
  result[:totalScore]= sum / norm

  return result.to_json
end






