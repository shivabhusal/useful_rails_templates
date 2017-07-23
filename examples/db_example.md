  
 #### For PG
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=pg
 
 # Short form
 $ rails app:template LOCATION=https://goo.gl/9s8NV6 db=pg
 ```
 
 **OUTPUT**
 ```ruby
 force  config/database.yml

 ```
 It will generate `database.yml` file with database names for your `application name`. Eg
 
 ```yaml
 default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: api_authentication_tutorial_development

test:
  <<: *default
  database: api_authentication_tutorial_test

production:
  <<: *default
  database: api_authentication_tutorial_production
  username: api_authentication_tutorial
  password: <%= ENV['API_AUTHENTICATION_TUTORIAL_DATABASE_PASSWORD'] %>

 ```
`api_authentication_tutorial` is my application name.
