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
- Examples
  - [Initial Application setup](examples/initial_app_setup_example.md)
  - [Database setup](examples/db_example.md)

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
