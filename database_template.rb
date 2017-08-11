# ------------------- MySQL -------------------------------
MYSQL_CONFIG = <<-MYSQL
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
<% if mysql_socket %>
  socket: <%= mysql_socket %>
<% else %>
  host: localhost
<% end %>

development:
  <<: *default
  database: <%= app_name %>_development

test:
  <<: *default
  database: <%= app_name %>_test

production:
  <<: *default
  database: <%= app_name %>_production
  username: <%= app_name %>
  password: <%%= ENV['<%= app_name.upcase %>_DATABASE_PASSWORD'] %>

MYSQL

# ------------------- PostGreSQL --------------------------
PG_CONFIG = <<-PG
default: &default
  adapter: postgresql
  encoding: unicode
  # For details on connection pooling, see Rails configuration guide
  # http://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: <%= app_name %>_development

test:
  <<: *default
  database: <%= app_name %>_test

production:
  <<: *default
  database: <%= app_name %>_production
  username: <%= app_name %>
  password: <%%= ENV['<%= app_name.upcase %>_DATABASE_PASSWORD'] %>
PG

# ------------------- SQLITE ------------------------------
SQLITE_CONFIG = <<-SQLITE
default: &default
  adapter: sqlite3
  pool: <%%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3
test:
  <<: *default
  database: db/test.sqlite3

production:
  <<: *default
  database: db/production.sqlite3
SQLITE

# --------------------- MS-SQL Server ------------------------------
SQL_SERVER_CONFIG = <<-SQLSERVER
# SQL Server (2012 or higher required)
#
# Install the adapters and driver
#   gem install tiny_tds
#   gem install activerecord-sqlserver-adapter
#
# Ensure the activerecord adapter and db driver gems are defined in your Gemfile
#   gem 'tiny_tds'
#   gem 'activerecord-sqlserver-adapter'
#
default: &default
  adapter: sqlserver
  encoding: utf8
  username: sa
  password: <%%= ENV['SA_PASSWORD'] %>
  host: localhost

development:
  <<: *default
  database: <%= app_name %>_development

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: <%= app_name %>_test

# As with config/secrets.yml, you never want to store sensitive information,
# like your database password, in your source code. If your source code is
# ever seen by anyone, they now have access to your database.
#
# Instead, provide the password as a unix environment variable when you boot
# the app. Read http://guides.rubyonrails.org/configuring.html#configuring-a-database
# for a full rundown on how to provide these environment variables in a
# production deployment.
#
# On Heroku and other platform providers, you may have a full connection URL
# available as an environment variable. For example:
#
#   DATABASE_URL="sqlserver://myuser:mypass@localhost/somedatabase"
#
# You can use this database configuration with:
#
#   production:
#     url: <%%= ENV['DATABASE_URL'] %>
#
production:
  <<: *default
  database: <%= app_name %>_production
  username: <%= app_name %>
  password: <%%= ENV['<%= app_name.upcase %>_DATABASE_PASSWORD'] %>
SQLSERVER

if ENV['db'] =~ /mysql/
  file 'config/database.yml', ERB.new(MYSQL_CONFIG).result(binding)
elsif ENV['db'] =~ /pg/ || ENV['db'] =~/post/
  file 'config/database.yml', ERB.new(PG_CONFIG).result(binding)
elsif ENV['db'] =~/sqlite/
  file 'config/database.yml', ERB.new(SQLITE_CONFIG).result(binding)
elsif ENV['db'] =~/server/
  file 'config/database.yml', ERB.new(SQL_SERVER_CONFIG).result(binding)
else
  puts 'Please pass a command like '
  puts "rails app:template path/to/template.rb db=mysql"
  puts "rails app:template path/to/template.rb db=pg"
  puts "rails app:template path/to/template.rb db=postgre"
  puts "rails app:template path/to/template.rb db=sqlite"
  puts "rails app:template path/to/template.rb db=sqlserver"
  puts "rails app:template path/to/template.rb db=server"
end

