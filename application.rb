require "rubygems"
require "bundler"
Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

class Application < Sinatra::Base
  register Sinatra::R18n
  register Sinatra::Partial

  get "/" do
    haml :index
  end
end

%w(settings helpers routes).each { |f| require_relative "config/#{f}" }
