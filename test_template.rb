
# This runs well with Rails 5.0 +

run "spring stop"
gem 'annotate'

gem_group :development, :test do
  gem 'zeus', require: false
  gem 'pry'
  gem 'rspec-rails'
end

gem_group :test do
  gem 'faker'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
end


environment <<-CONFIG 
config.generators do |generators|
      generators.test_framework  :rspec, fixture: false
      generators.javascripts false
      generators.helper false
      generators.view_specs false
      generators.helper_specs false
      generators.controller_specs true

      generators.model_specs true
      generators.fixtures false

      generators.stylesheets false
      generators.decorator_specs false
      generators.decorator false
    end
CONFIG

file 'spec/support/database_cleaner_config.rb', <<-CODE
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
CODE

file 'spec/support/factory_girl_config.rb', <<-CODE
# this will make `create`, `build` method available directly
#   no need to write like `FactoryGirl.create(:blahblah)`
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
CODE


file 'spec/support/shoulda_matcher_config.rb', <<-CODE
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
CODE

run "bundle install"
generate('rspec:install')
