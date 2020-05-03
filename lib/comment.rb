require_relative 'database_connection'

class Comment
    attr_reader :id, :description, :bookmark_id

  def initialize(id:, description:, bookmark_id:)
    @id = id
    @description = description
    @bookmark_id = bookmark_id
  end


  def self.create(bookmark_id:, description:)
    result = DatabaseConnection.query("INSERT INTO comments (bookmark_id, description) VALUES ('#{bookmark_id}','#{description}') RETURNING id, description, bookmark_id;")
    Comment.new( id: result[0]['id'], description: result[0]['description'], bookmark_id: result[0]['bookmark_id'])
  end

  def self.find_by_id(bookmark_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};")
    result.map do |comment|
      Comment.new(id: comment['id'], description: comment['description'], bookmark_id: comment['bookmark_id'])
    end
  end



  
end