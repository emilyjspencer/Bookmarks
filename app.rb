require 'sinatra/base'
require_relative './lib/bookmark'
require_relative './setup_database'

class BookmarkList < Sinatra::Base

  get '/' do
    "Save all your favourite web pages!"
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect '/bookmarks'
  end

  

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end






  



  run! if app_file == $0
  
end