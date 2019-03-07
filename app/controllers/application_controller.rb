require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
use Rack::Flash
  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "moneyroller"

  end

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(:id =>session[:user_id]) if session[:user_id]
    end

    def is_logged_in?
      !!current_user
    end

    def redirect_unless_logged_in
      if  !is_logged_in?
        redirect '/'
      end

    end
  end
  end
