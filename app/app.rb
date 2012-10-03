require 'rubygems'
require 'sinatra'
require 'require_relative'
require 'tilt/haml'

require 'app/models/trading/user'           #evt require_relative 'models/trading/user'
require 'app/controllers/main'
require 'app/controllers/authentication'


class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do


    rino = Trading::User.named( 'Rino')
    andi = Trading::User.named( 'Andi')
    lina = Trading::User.named( 'Lina')

    rino.add_new_item('book', 20)
    rino.add_new_item('cookie', 5)
    andi.add_new_item('smartphone', 200)
    andi.add_new_item('shoes', 30)
    lina.add_new_item('bag', 20)
    lina.add_new_item('printer', 150)
  end

# Now, run it
App.run!
end

