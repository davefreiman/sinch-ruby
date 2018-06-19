# Sinch Ruby REST API Wrapper #
[![Build Status](https://travis-ci.org/davefreiman/sinch-ruby.svg?branch=master)](https://travis-ci.org/davefreiman/sinch-ruby)
[![Gem Version](https://badge.fury.io/rb/sinch-ruby.svg)](https://badge.fury.io/rb/sinch-ruby)

## About ## 

[Sinch](https://www.sinch.com/) does a bunch of cool mobile features for native apps.

This gem provides API functionality to access the Sinch REST API with ruby

Currently the only implementation covers the [Verification API](https://www.sinch.com/docs/verification/)

## Installation ##

This gem is designed to work with rails. To install it, add the following to your Gemfile

    gem 'sinch-ruby', '0.2.2', require: 'sinch'
    
To install it via `gem install`:

    $ gem install sinch-ruby
    $ irb
    > require 'sinch'
    > # do things with Sinch
    
In order to make Authenticated requests, you'll need to configure the `application_key` and `secret_key`
from your Sinch account.

First, create an app in the [Sinch portal](https://portal.sinch.com), and then find your application_key.

Then, in an initializer, or wherever suits you:

    Sinch.configure do |config|
      config.application_key = '[your-application-key]'
      config.secret_key = '[your-application-secret]'
    end

## Usage ##

To call the api, call `.request` on the `Gateway` class, providing the resource as your first argument, and any params for the second

Currently the only resources supported are `:verification`, `:report_verification`, and `:send_sms`

### Verification Example ###

    gateway = Sinch::Gateway
    params = { phone_number: '+121255535555' }
    gateway.request(:verification, params) 

### ReportVerification Example ###

    gateway = Sinch::Gateway
    params = { phone_number: '+121255535555', code: '1337' }
    gateway.request(:report_verification, params) 

### SendSms Example ###

To send SMS to any given number through Sinch, you must be approved for a production app and have Full SMS Access enabled.
If you are using a sandbox app, you can only send SMS messages to the Verified Phone Number associated with the account 

    gateway = Sinch::Gateway
    
    # phone_number: The recipient's phone number
    # from (optional): The sender's phone number (Note: this needs to be an authorized number in your Sinch account)
    # message: SMS Body
    params = { phone_number: '+121255555555', from: '+121255535555', message: 'I have a very specific set of skills.' }
    gateway.request(:send_sms, params) 

## Stubbing Requests ##

This gem comes with a Bogus Gateway that can be used when you would like to stub the requests sent to the gateway
Below is a sample Rails initializer that will use the BogusGateway if the secrets are not set

    # ./config/initializers/sinch.rb
    
    secrets = Rails.application.secrets.sinch
    
    Sinch.configure do |config|
      config.gateway = Sinch::BogusGateway
      if secrets.present?
        config.application_key = secrets[:application_key]
        config.secret_key = '[your-application-secret]'
        config.gateway = Sinch::Gateway
      end
    end

## Contributing ##

All contributions should be fully tested with the rspec framework.

Please fork this repository and submit a pull request to the `develop` branch on github

## Testing ##

Tests are run with the rspec framework.

     # Clone the repository
     git clone git@github.com:davefreiman/sinch-rails.git
     
     # install dependencies
     bundle install
     
     # run tests
     bundle exec rspec

## License ##

Sinch Ruby is released under the [MIT License](https://opensource.org/licenses/MIT)
