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

  describe '.find' do
    it 'finds a bookmark by its id' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      result = Bookmark.find(id: bookmark.id)
      expect(result.id).to eq bookmark.id
      expect(result.url).to eq 'http://www.facebook.com'
    end
  end 

  describe '.edit' do 
    it 'edits a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      edited_bookmark = Bookmark.edit(id: bookmark.id, title: 'Instagram', url: 'http://www.instagram.com')
      expect(edited_bookmark.id).to eq bookmark.id
      expect(edited_bookmark.url).to eq 'http://www.instagram.com'
    end
  end 


end 