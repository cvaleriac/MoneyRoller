require 'rack-flash'

class RolloversController < ApplicationController
  use Rack::Flash



    get "/rollovers/new" do
    erb :'/rollovers/new'
    end

    post "/rollovers" do
      @rollover = Rollover.new(params[:rollover])
      @rollover.save
      flash[:message] = "Successfully created Rollover."
      redirect "/rollovers/#{@rollover.id}"
    end


    get "/rollovers/:id" do
    @rollover = Rollover.find(params[:id])
    erb :'/rollovers/show'
    end

    get "/rollovers" do
      @rollovers = Rollover.all
      erb :'/rollovers/index'
    end

    get "/rollovers/:id/edit" do
      @rollover = Rollover.find(params[:id])
      erb :'/rollovers/edit'
    end

    patch "/rollovers/:id" do
      @rollover = Rollover.find(params[:id])
      @rollover.update(params[:rollover])
        flash[:message] = "Successfully edited Rollover."
      redirect "/rollovers/#{@rollover.id}"
    end

    delete "/rollovers/:id" do
      @rollover = Rollover.find(params[:id])
      @rollover.destroy
      redirect "/rollovers"
    end

end
