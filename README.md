# README

This README would normally document whatever steps are necessary to get the
application up and running.

### Ruby version
    ruby 2.6.3p62
    
### Database creation
PGadmnin database were used in the application.
to connect to the database few steps are necessary to do:
1. PGadmin Database.
2. a created empty database with the name 'selfie'
3. setup info in Config> database.yml file. the configuration need to be setup, for example:
        development:
          database: selfie
          password: password 
if the database has a password, the password need to added
4. run command 'RAILS_ENV=migration rake db:migrate'
    
### Rails Server
to run rails server:
1. to run the server, write the commend 'rails s'. make sure you are in application folder.
