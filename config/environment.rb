require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require_relative '../lib/xkomer'
require_relative '../apps/web/application'

Hanami.configure do
  mount Web::Application, at: '/'

  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/xkomer_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/xkomer_development'
    #    adapter :sql, 'mysql://localhost/xkomer_development'
    #
    adapter :sql, ENV['DATABASE_URL']

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/xkomer/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json

    mailer do
      delivery :smtp,
        user_name: ENV['SENDGRID_USERNAME'],
        password: ENV['SENDGRID_PASSWORD'],
        domain: 'x-komer.herokuapp.com',
        address: 'smtp.sendgrid.net',
        port: 587,
        authentication: :plain,
        enable_starttls_auto: true
    end
  end
end
