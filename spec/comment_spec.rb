require 'comment'
require 'bookmark'
require 'database_helpers'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      comment = Comment.create(description: 'Facebook is so 2010', bookmark_id: bookmark.id)
      persisted_data = persisted_data(id: comment.id, table: 'comments')
      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.description).to eq 'Facebook is so 2010'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.find_by_id' do
    it 'finds comments by id' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Facebook')
      comment = Comment.create(description: 'Instagram is where it is at', bookmark_id: bookmark.id)
      Comment.create(description: 'I agree', bookmark_id: bookmark.id)
      comments = Comment.find_by_id(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.description).to eq 'Instagram is where it is at'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end