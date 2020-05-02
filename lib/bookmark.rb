require_relative 'database_connection' 



  class Bookmark
      attr_reader :id, :url, :title

    def initialize(id:, url:, title:)
      @id = id
      @url = url
      @title = title
    end

    def self.create(url:, title:)
      result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
      Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])
    end
    

    def self.all
      bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks;')
      bookmarks.map { |bookmark|
        Bookmark.new(url: bookmark['url'], id: bookmark['id'], title: bookmark['title'])
      }
    end

    def self.delete(id:)
      DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
    end

end 

  