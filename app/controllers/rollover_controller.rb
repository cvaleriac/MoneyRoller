class RolloversController < ApplicationController

    get "/rollovers" do
      @rollovers = Rollover.all
      erb :'/rollovers/index'
    end

    get "/rollover/:id" do
    @rollover = Rollover.find(params[:id])
    erb :'/rollovers/show'
    end


end
