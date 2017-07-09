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

if ENV['db'] =~ /mysql/
  file 'config/database.yml', ERB.new(MYSQL_CONFIG).result(binding)
elsif ENV['db'] =~ /pg/ || ENV['db'] =~/post/
  file 'config/database.yml', ERB.new(PG_CONFIG).result(binding)
elsif ENV['db'] =~/sqlite/
  file 'config/database.yml', ERB.new(SQLITE_CONFIG).result(binding)
else
  puts 'Please pass a command like '
  puts "rails app:template path/to/template.rb db=mysql"
  puts "rails app:template path/to/template.rb db=pg"
  puts "rails app:template path/to/template.rb db=postgre"
  puts "rails app:template path/to/template.rb db=sqlite"
end
