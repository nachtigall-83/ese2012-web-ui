require 'rubygems'
require 'sinatra'
require 'require_relative'
require 'tilt/haml'

require 'models/trading/user'           #evt require_relative 'models/trading/user'
require '../app/controllers/main'
require '../app/controllers/authentication'


class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do


    user1 = Trading::User.named( 'ese').save()
    user2 = Trading::User.named( 'Erwann' ).save()
    Trading::User.named( 'Joel' ).save()
    Trading::User.named( 'Aaron').save()
    Trading::Item.named( 'book', 20, user1).save()
    Trading::Item.named( 'cookie', 5, user2).save()
  end

# Now, run it
App.run!
end

