require "sinatra"

require_relative "../google_client"

class Api < Sinatra::Base
  get '/' do
    "hello"
  end

  get "/google" do
    GoogleClient.new.get
  end
end
