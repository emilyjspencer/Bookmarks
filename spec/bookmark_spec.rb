require 'bookmark'
require 'database_helpers'

describe Bookmark do
  let(:comment_class) { double(:comment_class) }
  let(:tag_class) { double(:tag_class) }

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

     it 'a bookmark is not created if the url is invalid' do
        bookmark = Bookmark.create(title: 'Phoney', url: 'w.w.t.imafakeurl')
        expect(bookmark).not_to be_a Bookmark
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

  describe '#add_comment' do
    it 'calls .find_by_id on the Comment class' do
      bookmark = Bookmark.create(title: 'Instagram', url: 'http://www.instagram.com')
      expect(comment_class).to receive(:find_by_id).with(bookmark_id: bookmark.id)
      bookmark.add_comment(comment_class)
    end
  end

  describe 'add_tag' do
    it 'calls .find_by_id on the Tag class' do
      bookmark = Bookmark.create(title: 'Instagram', url: 'http://www.instagram.com')
      expect(tag_class).to receive(:find_by_id).with(bookmark_id: bookmark.id)
      bookmark.add_tag(tag_class)
    end
  end


end 