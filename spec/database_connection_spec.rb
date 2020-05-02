require 'database_connection'

 describe DatabaseConnection do

  
   describe '.establish_connection' do 
     it 'sets up a connection to a database using PG' do
       expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_new_test')
       DatabaseConnection.establish_connection('bookmark_manager_new_test') 
     end
   end

   describe '.query' do 
     it 'queries the database using PG' do
       connection = DatabaseConnection.establish_connection('bookmark_manager_new_test') 
       expect(connection).to receive(:exec).with("SELECT * FROM bookmark_manager_new;") 
       DatabaseConnection.query("SELECT * FROM bookmark_manager_new;") 
     end   
   end

 end