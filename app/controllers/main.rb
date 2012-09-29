require 'tilt/haml'
require 'app/models/trading/user'
class Main < Sinatra::Application

  get "/" do

    redirect '/login' unless session[:name]

    haml :list_items, :locals => { :time => Time.now ,
                                      :items => Trading::Item.all,
                                      :current_name => session[:name] }
  end

  end