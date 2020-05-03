require 'bookmark_tag'

describe BookmarkTag do
  describe '.create' do
    it 'makes an association between bookmarks and tags' do
      bookmark = Bookmark.create(url: 'https://www.sylvanianfamilies.com/en-uk/', title: 'Sylvanian Families')
      tag = Tag.create(content: 'Cute')
      bookmark_tag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)
      expect(bookmark_tag.tag_id).to eq tag.id
      expect(bookmark_tag.bookmark_id).to eq bookmark.id
    end
  end
end