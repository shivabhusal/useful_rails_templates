![](http://www.rubyonrailspro.com/wp-content/uploads/2017/04/logo.png) ![](https://int-dir.s3.amazonaws.com/uploads/293_293_icon_512x512_2x.png)

# Some really Useful Rails Templates
You can find some very useful rails templates to generate boiler plate codes in your Rails app. You can send Pull Requests 
for some useful templates that can be useful for others as well.

<!-- TOC START min:1 max:3 link:true update:true -->
- [Some really Useful Rails Templates](#some-really-useful-rails-templates)
  - [Basic Scaffold for App setup [For Dev and Test mode]](#basic-scaffold-for-app-setup-for-dev-and-test-mode)
    - [Usage](#usage)
  - [Generate Database config `database.yml` per requirement](#generate-database-config-databaseyml-per-requirement)
  - [Mailer setup](#mailer-setup)
  - [Figaro Configs : config/application.yml](#figaro-configs--configapplicationyml)

<!-- TOC END -->

You can use these templates on already existing application as well.

## Basic Scaffold for App setup [For Dev and Test mode]
This will do the following
- Add gems `rspec`, `slim-rails`, `annotate`, `zeus`, `pry`, 
`rspec-rails`, `faker`, `database_cleaner`, `factory_girl_rails`,
  `shoulda-matchers` and `rails-controller-testing` to your Gemfile. 
  
  > **Note**: But this will not add twice, it will add only if there is not already.
  
  Will add necessary config files to `spec/support/` for above mentioned gems to be used in `test-mode`. 
  Will install the `bundle` and install RSpec as well. 
  

### Usage

```bash
$ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/test_template.rb

# Short Form
$ rails app:template LOCATION=https://goo.gl/f6P7ne
```
Make sure you are on root directory of your application.
**OUTPUT**
```ruby
         run  spring stop from "."
Spring stopped.
     gemfile  annotate
     gemfile  group :development, :test
      append  Gemfile
     gemfile  zeus
     gemfile  pry
     gemfile  rspec-rails
      append  Gemfile
     gemfile  group :test
      append  Gemfile
     gemfile  faker
     gemfile  database_cleaner
     gemfile  factory_girl_rails
     gemfile  shoulda-matchers (~> 3.1)
     gemfile  rails-controller-testing
      append  Gemfile
      create  spec/support/database_cleaner_config.rb
      create  spec/support/factory_girl_config.rb
      create  spec/support/shoulda_matcher_config.rb
         run  bundle install from "."
Using rake 12.0.0
Using concurrent-ruby 1.0.5
Using i18n 0.8.5
Using minitest 5.10.2
Using thread_safe 0.3.6
Using builder 3.2.3
...
Using rails 5.1.2

Bundle complete! 17 Gemfile dependencies, 65 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
    generate  rspec:install
Running via Spring preloader in process 26187
      create  .rspec
       exist  spec
      create  spec/spec_helper.rb
      create  spec/rails_helper.rb

```

## Generate Database config `database.yml` per requirement
This is pretty useful when you generated your app without specifying `-d=database_name`, Rails configure your app with
 `sqlite3`, but your requirement is `mysql`. Or, you were knowingly using `mysql` but needed to move to `pg`.
 
 **How to get the initial `database.yml` file** so that you can modify it?
 
 ### Usage
 #### For MySQL
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=mysql
 
 # Short Form
 $ rails app:template LOCATION=https://goo.gl/9s8NV6 db=mysql
 ```
 
 #### For PG
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=pg
 
 # Short form
 $ rails app:template LOCATION=https://goo.gl/9s8NV6 db=pg
 ```

 #### For SQLite3
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=sqlite
 
 # Short form
 $ rails app:template LOCATION=https://goo.gl/9s8NV6 db=sqlite
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

## Mailer setup
Will add gem `premailer-rails` to Gemfile and set config in `config/application.rb`.
Use command
```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/mailer_template.rb
 
 # Short Form
 $ rails app:template LOCATION=https://goo.gl/iG8NS9 mailer=true
```

## Figaro Configs : config/application.yml
Use command

```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/figaro_template.rb

 # Short Form
 $ rails app:template LOCATION=https://goo.gl/BVvfZb figaro=true
```
