require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './setup_database'
require 'uri'

class BookmarkList < Sinatra::Base
    register Sinatra::Flash
    enable :sessions, :method_override


  get '/' do
    "Save all of your favourite web pages!"
  end 

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    flash[:notice] = "Please submit a valid url" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end 

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:'bookmarks/edit')
  end 


  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end






  run! if app_file == $0
  
end