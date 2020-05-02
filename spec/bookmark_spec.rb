require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: "http://www.google.com", title: "Google")
      Bookmark.create(url: "http://www.google.com", title: "Google")
      bookmarks = Bookmark.all
      expect(bookmarks.last.url).to eq "http://www.google.com"
      expect(bookmarks.last.title).to eq "Google"
    end
  end

  describe '.create' do 
    it 'creates a bookmark with a url and title' do
       bookmark = Bookmark.create(url: 'http://www.google.com', title: 'Google')
       persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')
       expect(bookmark.url).to eq 'http://www.google.com'
       expect(bookmark.id).to eq persisted_data.first['id'] 
       expect(bookmark.title).to eq 'Google'
     end 
  end 

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      Bookmark.create(url:'http://ww.instagram.com',  title: 'Instagram')
      Bookmark.delete(id: bookmark.id)
      expect(bookmark.title).not_to eq 'Instagram'
    end 
  end 


end 