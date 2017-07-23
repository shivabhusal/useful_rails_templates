
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
