require 'securerandom'
gem 'figaro'

config = -> { <<-CONFIG }
development: &default
  FB_APP_ID:                    '17X57631681080XX'
  FB_APP_SECRET:                '502b90b29ab12220465f40bf9ca3eaXX'

  GOOGLE_CLIENT_ID:             '796633432437-l9u9488v5e8e3r9ic2mdjnpf6dh7h8ks.apps.googleusercontent.com'
  GOOGLE_CLIENT_SECRET:         'wbzJkicx7p4rmhG9tssQ7ZXk'
  GOOGLE_MAP_API:               'wbzJkicx7p4rmhG9tssQ7ZXk'

  TWITTER_API:                  'XHvE6GaJHaBQqwVSkZnerWtt3'
  TWITTER_API_SECRET:           'LycedsEwxe2fr5x1SmmdmNduSC9GX8m1NamoXFwONbHfdHZe4M'
  TWITTER_ACCESS_TOKEN:         '128795105-eZwkOCmthik91Rp453faclTLBOYiLeP17XFnw610'
  TWITTER_ACCESS_TOKEN_SECRET:  'HZvTNn637aF2YTgCZdtaGU6FhzwQ3FToxtG4rgylVMDIz'

  AWS_ACCESS_KEY_ID:            'AKIAXXVTYMQHSFMDTJLA'
  AWS_SECRET_ACCESS_KEY:        'm3JtE90o9ThXXDQHDmMeMKXS8BtrvcSXOgbGiI'

  PROTOCOL:                     'http'
  HOST:                         'localhost'
  PORT:                         3000

  SMTP_ADDRESS:                 'localhost'
  SMTP_PORT:                    1025 # For mailcatcher
  SMTP_USERNAME:
  SMTP_PASSWORD:

test:
  <<: *default

staging:
  <<: *default
  SECRET_KEY_BASE:        '#{SecureRandom.hex(64)}'

production:
  <<: *default
  SECRET_KEY_BASE:        '#{SecureRandom.hex(64)}'
  FB_APP_ID:              '17857631681080XX'
  FB_APP_SECRET:          '502b90b29ab12220465f40bf9ca3eaXX'

  GOOGLE_CLIENT_ID:       '79663343XX37-l9u9488v5e8e3r9ic2mdjnpf6dh7h8ks.apps.googleusercontent.com'
  GOOGLE_CLIENT_SECRET:   'wbzJkicx7p4rXXG9tssQ7ZXk'
  GOOGLE_MAP_API:         'wbzJkicx7p4rXXG9tssQ7ZXk'

  AWS_ACCESS_KEY_ID:      'AKIAI7VTYMQHXXMDTJLA'
  AWS_SECRET_ACCESS_KEY:  'm3JtE90o9ThaXXQHDmMeMKXS8BtrvcSXOgbGiI'

  PROTOCOL:               'http'
  HOST:                   'localhost'
  PORT:                   3000

## Send Grid Configs
#  SMTP_ADDRESS:           'smtp.sendgrid.net'
#  SMTP_PORT:              587
#  SMTP_USERNAME:          'myemailid'
#  SMTP_PASSWORD:          'mypassword'
#  AUTHENTICATION:         'plain'

  SMTP_ADDRESS:           'smtp.gmail.com'
  SMTP_DOMAIN:            'example.com'
  SMTP_PORT:              587
  SMTP_USERNAME:          'myemailid'
  SMTP_PASSWORD:          'mypassword'
  AUTHENTICATION:         'plain'

  DATABASE_PASSWORD:      'mypassword'
  DATABASE_USER:          'mydbusername'
  DATABASE_NAME:          'db_my_project'
CONFIG

file 'app/config/application.yml', config.call
file 'app/config/sample.application.yml', config.call
