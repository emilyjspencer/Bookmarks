require 'bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmarks = Bookmark.all
  
      expect(bookmarks).to include "https://www.theguardian.com/uk"
      expect(bookmarks).to include "https://www.bbc.co.uk/news"
      expect(bookmarks).to include "http://www.google.com"
    end
  end

end 