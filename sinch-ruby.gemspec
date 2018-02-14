Gem::Specification.new do |s|
  s.name        = 'sinch-ruby'
  s.version     = '0.1.0'
  s.date        = '2018-02-14'
  s.summary     = 'Sinch REST Api Wrapper'
  s.description = 'A library for communicating with the Sinch Rest API'
  s.authors     = ['David Freiman']
  s.email       = 'dfreiman@feedbackapp.ca'
  s.files       = ['lib/sinch.rb']
  s.homepage    = 'http://rubygems.org/gems/sinch'
  s.license     = 'MIT'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rubocop'
  s.add_runtime_dependency 'httparty'
end
