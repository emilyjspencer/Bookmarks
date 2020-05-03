require 'database_helpers'
require 'bookmark'
require 'tag'

describe Tag do

  describe '.create' do
    it 'creates an instance of the Tag class' do
      tag = Tag.create(content: 'Might remove')
      persisted_data = persisted_data(id: tag.id, table: 'tags')
      expect(tag.id).to eq persisted_data.first['id']
      expect(tag.content).to eq 'Might remove'
    end
  end

  describe '.find_by_id' do
    it 'returns tags according to the bookmark id' do
      bookmark = Bookmark.create(url: 'http://facebook.com', title: 'Facebook')
      tag1 = Tag.create(content: 'Brilliant')
      tag2 = Tag.create(content: 'Excellent')
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag1.id)
      BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag2.id)
      tags = Tag.find_by_id(bookmark_id: bookmark.id)
      tag = tags.first
      expect(tag.id).to eq tag1.id
      expect(tag.content).to eq tag1.content
    end
  end
end