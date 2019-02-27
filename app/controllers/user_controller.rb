require 'rack-flash'

class UserController < ApplicationController
  use Rack::Flash

  get "/signup" do
    if is_logged_in?
      redirect '/show'
    else
  erb :'/users/new'
end
end

post "/signup" do
  if !User.find_by(:username => params[:username]).nil?
    flash[:message] = "This username is already taken. Please choose another!"
    erb :"users/new"
  else

  @user = User.new(:username => params[:username], :password => params[:password])
  if !params[:username].empty? && @user.save
    session[:user_id] = @user.id
    redirect '/login'
  else
    flash[:message] = "There was an error. Please try again"
    erb :"users/new"
  end
end
end

get "/login" do
  if is_logged_in?
    redirect "/rollovers"
  else
  erb :'/users/login'
  end
end

post '/login' do
  @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/show"
    else
      flash[:message] = "Login failed. Please try again!"
      erb :'users/login'
    end
  end

get '/show' do
  @user = User.find(session[:user_id])
  erb :'/users/show'
end

get "/logout" do
  session.clear
  redirect "/"
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :"/users/show"
end

end
