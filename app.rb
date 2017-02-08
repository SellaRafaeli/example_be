puts "starting app..."

require 'bundler'

require 'active_support'
require 'active_support/core_ext'
require 'sinatra/reloader' #dev-only
# require 'sinatra/activerecord'

puts "requiring gems..."

Bundler.require

Dotenv.load

$app_name   = 'example_be'

require './setup'
require './my_lib'

require_all './db'
require_all './admin'
require_all './bl'
require_all './comm'
require_all './logging'
require_all './mw'

include Helpers #makes helpers globally available 

get '/' do
  {msg: 'hi from example_be'}
end

get '/ping' do 
  'pong'
end