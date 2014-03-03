require "rubygems"
require "sinatra/base"
require "haml"
require 'sinatra/reloader'

class MyApp < Sinatra::Base

  # auto reload
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    haml :index
  end

  get '/hello/:name' do
    haml :hello
  end

  get '/test/:name' do
    haml :hello
  end

end

