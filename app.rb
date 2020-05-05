require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/bookmark'
require_relative 'lib/comment'
require_relative './lib/tag'
require_relative './lib/bookmark_tag'
require_relative 'setup_database'
require 'uri'

class BookmarkList < Sinatra::Base
    register Sinatra::Flash
    enable :sessions, :method_override

    get '/sessions/new' do
      erb(:'sessions/new')
    end
  
    post '/sessions' do
      user = User.authenticate(username: params[:username], email: params[:email], password: params[:password])
      if user
        session[:user_id] = user.id
        redirect('/bookmarks')
        flash[:success] = "Welcome, #{user.username}"
      else
        flash[:notice] = 'Incorrect login information. Please try again.'
        redirect '/sessions/new'
      end
    end

    post '/sessions/destroy' do
      session.clear
      flash[:notice] = 'You have been successfully signed out.'
      redirect('/')
    end

   

    get '/' do
      erb(:"home/index")
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

  get '/bookmarks/:id/comments/new' do
    @bookmark_id = params[:id]
    erb(:'comments/new')
  end

  post '/bookmarks/:id/comments' do
    Comment.create(description: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/tags/new' do
    @bookmark_id = params[:id]
    erb :'/tags/new'
  end

  post '/bookmarks/:id/tags' do
    tag = Tag.create(content: params[:tag])
    BookmarkTag.create(bookmark_id: params[:id], tag_id: tag.id)
    redirect '/bookmarks'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/bookmarks'
  end




  run! if app_file == $0
  
end