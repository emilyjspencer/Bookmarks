require_relative 'database_connection' 
require 'uri'


  class Bookmark
      attr_reader :id, :url, :title

    def initialize(id:, url:, title:)
      @id = id
      @url = url
      @title = title
    end

    def self.create(url:, title:)
      return false unless valid_url?(url)
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

    def self.edit(id:, title:, url:)
      result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, title, url;")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end 

    def self.find(id:)
      result =  DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id}")
      Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end 

    private

    def self.valid_url?(url)
      url =~ /\A#{URI::regexp(['http', 'https'])}\z/
    end

end 

  