class UserController < ApplicationController

  get "/signup" do
  erb :'/users/signup'
end

post "/signup" do
  if params[:username].empty?
    redirect to '/failure'
  end

  user = User.new(:username => params[:username], :password => params[:password])
  if user.save
    redirect '/login'
  else
    redirect '/failure'
  end
end

get "/login" do
  erb :'/users/login'
end

post '/login' do
  user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session["user_id"] = user.id
      redirect to "/user_rollovers"
    else
      redirect to "/login"
    end
  end

get '/user_rollovers' do
  @user = User.find(session[:user_id])
  erb :'/users/user_rollovers'
end

get "/failure" do
  erb :'/users/failure'
end

get "/logout" do
  session.clear
  redirect "/"
end

end
