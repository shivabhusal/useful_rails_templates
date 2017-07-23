
# This runs well with Rails 5.0 +

run 'spring stop'
puts 'Please make sure you have application.yml set; run the following if not'
puts
puts 'rails app:template LOCATION=https://goo.gl/BVvfZb figaro=true'

# Auto converts external CSS to inline and Internal CSS
gem 'premailer-rails'

queue_adapter = ENV['queue_adapter'] || ENV['q'] || 'sidekiq'
mailer_queue  = ENV['queue'] || 'default'

# Sets in config/application.rb
environment <<-CONFIG
# Now email sent using `deliver_later` method will be sent via `#{queue_adapter}`
    config.active_job.queue_adapter = :#{queue_adapter} 
    
    # '#{mailer_queue}' queue of #{queue_adapter} will be used
    config.action_mailer.deliver_later_queue_name = '#{mailer_queue}'
CONFIG

environment <<-CONFIG
# Configure app to send every email to `mailcatcher`'s server
    config.action_mailer.default_url_options = { host: ENV['HOST'],
                                                 protocol: ENV['PROTOCOL'], port: ENV['PORT'] }
    
    config.action_mailer.asset_host = "\#{ENV['PROTOCOL']}://\#{ENV['HOST']}:\#{ENV['PORT']}"
    
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings   = {
      address:              ENV['SMTP_ADDRESS'],
      port:                 ENV['SMTP_PORT'],
      domain:               ENV['DOMAIN'],
      user_name:            ENV['SMTP_USERNAME'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       'plain',
      enable_starttls_auto: true }
CONFIG

run 'bundle install'
