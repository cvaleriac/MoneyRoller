class RolloversController < ApplicationController

    get "/rollovers" do
      @rollovers = Rollover.all
      erb :'rollovers/index'
    end
end
