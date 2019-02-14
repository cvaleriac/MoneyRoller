class RolloversController < ApplicationController


    get "/rollover/new" do
    erb :'/rollovers/new'
    end

    post "/rollovers" do

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
