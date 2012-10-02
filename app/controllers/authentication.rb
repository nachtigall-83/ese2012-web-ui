require 'tilt/haml'
require 'app/models/trading/user'

class Authentication < Sinatra::Application

  get "/login" do
    haml :login
  end

  post "/login" do
    name = params[:username]
    password = params[:password]

    fail "Empty username or password" if name.nil? or password.nil?

    user = Trading::User.by_name name
    # Here, authentication succeeds if username==password
    # In a real application, we would of
    # course check the password differently.
    fail "Username or password are not valid" if user.nil? or password != name

    session[:name] = name
    redirect '/'
  end

  get "/logout" do
    session[:name] = nil
    redirect '/login'
  end

end