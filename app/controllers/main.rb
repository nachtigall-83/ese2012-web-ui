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

    post "/buy" do
    #To do
    end
  end
end
