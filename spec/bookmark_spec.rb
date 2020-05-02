require 'bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: "http://www.google.com")
      Bookmark.create(url: "http://www.google.com")
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq 'http://www.google.com' 
    end
  end

  describe '.create' do 
    it 'creates a bookmark with a url' do
       bookmark = Bookmark.create(url: 'http://www.google.com')
       persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')
       expect(bookmark.url).to eq 'http://www.google.com'
       expect(bookmark.id).to eq persisted_data.first['id'] 
     end 
  end 


end 