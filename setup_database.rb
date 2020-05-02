require './lib/database_connection'

 if ENV['ENVIRONMENT'] == 'test'
   DatabaseConnection.establish_connection('bookmark_manager_new_test') 
 else
   DatabaseConnection.establish_connection('bookmark_manager_new') 
 end