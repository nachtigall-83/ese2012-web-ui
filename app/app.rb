require 'rubygems'
require 'sinatra'
#require 'require_relative'
require 'haml'

require 'models/trading/user'           #evt require_relative 'models/trading/user'
require 'controllers/main'
require 'controllers/authentication'


class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do


    rino = Trading::User.named( 'Rino')
    ese = Trading::User.named( 'ese')
    lina = Trading::User.named( 'Lina')

    rino.add_new_item('book', 20)
    rino.add_new_item('cookie', 5)
    ese.add_new_item('smartphone', 200)
    ese.add_new_item('shoes', 30)
    lina.add_new_item('bag', 20)
    lina.add_new_item('printer', 150)

    rino.save
    andi.save
    lina.save
  end

end

# Now, run it
App.run!


