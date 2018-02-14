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
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'activesupport', '~> 5.1'
  s.add_development_dependency 'vcr', '~> 4.0'
  s.add_development_dependency 'webmock', '~> 3.3'
  s.add_development_dependency 'simplecov', '~> 0.14.0'
  s.add_development_dependency 'rubocop', '~> 0.49.0'
  s.add_runtime_dependency 'httparty', '~> 0.15.6'
end
