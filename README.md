![](http://www.rubyonrailspro.com/wp-content/uploads/2017/04/logo.png) ![](https://int-dir.s3.amazonaws.com/uploads/293_293_icon_512x512_2x.png)

# Some really Useful Rails Templates
You can find some very useful rails templates to generate boiler plate codes in your Rails app. You can send Pull Requests 
for some useful templates that can be useful for others as well.

You can use these templates on already existing application as well.
## Test Configs generation Template

### Usage

```bash
$ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/test_template.rb
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
 ```
 
 #### For PG
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=pg
 ```

 #### For SQLite3
 ```bash
 $ rails app:template LOCATION=https://raw.githubusercontent.com/shivabhusal/useful_rails_templates/master/database_template.rb db=sqlite
 ```
 
 **OUTPUT**
 ```ruby
 force  config/database.yml

 ```
