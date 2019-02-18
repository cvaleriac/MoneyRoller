class UserController < ApplicationController

  get "/signup" do
  erb :'/users/new'
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
      session[:user_id] = user.id
      redirect to "/show"
    else
      redirect to "/failure"
    end
  end

get '/show' do
  @user = User.find(session[:user_id])
  erb :'/users/show'
end

get "/failure" do
  erb :'/users/failure'
end

get "/logout" do
  session.clear
  redirect "/"
end

end
