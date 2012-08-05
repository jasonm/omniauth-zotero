require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-zotero'

class App < Sinatra::Base
  get '/' do
    redirect '/auth/zotero'
  end

  get '/auth/:provider/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :zotero, ENV['ZOTERO_KEY'], ENV['ZOTERO_SECRET']
end

run App.new
