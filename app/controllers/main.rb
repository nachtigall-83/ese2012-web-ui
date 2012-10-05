require 'tilt/haml'
require 'app/models/trading/user'

module Controllers


  class Main < Sinatra::Application

    before do
      redirect '/login' unless session[:name]
    end

    get "/" do
      redirect "/list_active_items"
    end

    get "/list_active_items" do
    #To do
      haml :list_active_items, :locals => {:items => Trading::Item.all,
                                      :current_name => session[:name] }
    end

    get "/user/:name" do
      user = Trading::User.by_name(params[:name])
      haml :list_items_of_user, :locals =>{:user => user}
    end

    post "/buy" do
      item = Trading::Item.by_name(params[:item])
      user = Trading::User.by_name(params[:name])
      user.buy_item(item)
      redirect '/index'
    end

  end
end

