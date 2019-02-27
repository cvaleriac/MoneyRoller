require 'rack-flash'

class RolloversController < ApplicationController
  use Rack::Flash

    get "/rollovers/new" do
    erb :'/rollovers/new'
    end

    post "/rollovers" do
      @rollover = Rollover.new(params[:rollover])
      if valid_params? && @rollover.save
      flash[:message] = "Successfully created Rollover."
      redirect "/rollovers/#{@rollover.id}"
    else
      erb "/rollovers/new"
    end
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
        @rollover = Rollover.find_by(id: params[:id])
      if is_logged_in? && current_user == @rollover.user
      erb :'/rollovers/edit'
    else
      flash[:message] = "You cannot edit this rollover"
      redirect "/rollovers"
    end
  end

    post "/rollovers" do
      @rollover = Rollover.new(params[:rollover])
      @rollover = current_user.rollover.build(params[:rollover])
      if valid_params? && @rollover.save
        redirect "/rollovers/#{@rollover.id}"
      else
        erb :"/rollovers/new"
      end
    end

    patch "/rollovers/:id" do
      @rollover = Rollover.find_by(id: params[:id])
      if is_logged_in? && current_user == @rollover.user
      if valid_params?
         @rollover.update(params[:rollover])
        flash[:message] = "Successfully edited Rollover."
      redirect "/rollovers/#{@rollover.id}"
  else
    redirect "rollovers/#{@rollover.id}/edit"
  end
else
  flash[:message] = "You do not have permission"
  redirect "/rollovers"
  end
end
    delete "/rollovers/:id/delete" do
      @rollover = Rollover.find_by(id: params[:id])
      if is_logged_in? && current_user == @rollover.user
      @rollover.delete
    else
      flash[:message] = "You cannot delete this rollover."
    end
      redirect "/rollovers"
    end

    helpers do
      def valid_params?
        params[:rollover].none? do |k, v|
          v == ""
    end
  end
end

end
