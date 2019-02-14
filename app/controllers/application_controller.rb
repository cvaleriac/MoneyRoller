require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "moneyroller"

  end

  get "/" do
    erb :index
  end

end
