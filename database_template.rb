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
default: &default
  adapter: sqlserver
  encoding: utf8
  host: localhost
  dataserver:
  port: 1433
  username: arxfit
  password: P@ssword
  pool: 5
  timeout: 5000
  azure: true
  login_timeout: 5000

development:
  <<: *default
  database: <%= app_name %>_development

production:
  <<: *default
  adapter: sqlserver
  encoding: utf8
  host: something.database.secure.windows.net
  dataserver:
  port: 1433
  username: myapp
  password: P@ssword
  pool: 5
  timeout: 5000
  azure: true
  login_timeout: 5000
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
end

