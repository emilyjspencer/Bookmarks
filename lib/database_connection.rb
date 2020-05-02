require 'pg'

class DatabaseConnection 

   def self.establish_connection(dbname) 
     @connection = PG.connect(dbname: dbname)
   end

   def self.query(sql)  
     @connection.exec(sql)
   end
end 