class RolloversController < ApplicationController


    get "/rollovers/new" do
    erb :'/rollovers/new'
    end

    post "/rollovers" do
      @rollover = Rollover.create(params[:rollover])
      redirect "/rollovers/#{@rollover.id}"
    end


    get "/rollover/:id" do
    @rollover = Rollover.find(params[:id])
    erb :'/rollovers/show'
    end

    get "/rollovers" do
      @rollovers = Rollover.all
      erb :'/rollovers/index'
    end


end
