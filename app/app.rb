require 'rubygems'
require 'sinatra'
require 'require_relative'
require 'tilt/haml'
require_relative  'models/trading/user'
require_relative '../app/controllers/main'
require_relative '../app/controllers/authentication'

class App < Sinatra::Base

  use Authentication
  use Main

  enable :sessions
  set :public_folder, 'app/public'

  configure :development do
    University::User.named( 'Erwann' ).save()
    University::User.named( 'Joel' ).save()
    University::User.named( 'Aaron').save()
    University::Item.named( 'cookie', 5, Erwann).save()
 end
# Now, run it
App.run!
end
