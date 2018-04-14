require 'sinatra/base'
require 'slim'
require 'sass'
require 'sinatra/flash'
require 'pony'
require './sinatra/auth'
require 'coffee-script'
require './asset-handler'

class Website < Sinatra::Base
  register Sinatra::Auth
  register Sinatra::Flash
  use AssetHandler

  configure do
    set :session_secret, 'arsndsnfsjdnjnvnvdjfnvjfjsdndsjvndvjnjnjnjdjj'
    enable :sessions
    set :username, 'frank'
    set :password, 'sinatra'
  end

  before do
    set_title
  end
  
  def css(*stylesheets)
    stylesheets.map do |stylesheet|
      "<link href=\"/#{stylesheet}.css\" media=\"screen, projection\" rel=\"stylesheet\" />"
    end.join
  end

  def current?(path='/')
    request.path == path || request.path == path+'/' ? 'current' : nil
  end

  def set_title
    @title ||= 'Songs By Sinatra'
  end

  def send_message
    # Go away, I am not sending...
  end
  
  get '/' do
    slim :home
  end
  
  get '/about' do
    @title = 'All About This Website'
    slim :about
  end
  
  get '/contact' do
    slim :contact
  end
  
  post '/contact' do
    send_message
    flash[:notice] = 'Thank you for your message. We will be in touch soon'
    redirect to '/'
  end
  
  not_found do
    slim :not_found
  end
  
  get '/set/:name' do
    session[:name] = params[:name]
  end
  
  get '/get/hello' do
    "Hello #{session[:name]}"
  end
  
end
