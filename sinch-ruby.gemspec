Gem::Specification.new do |s|
  s.name        = 'sinch-ruby'
  s.version     = '0.1.3'
  s.date        = '2018-02-14'
  s.summary     = 'Sinch REST Api Wrapper'
  s.description = 'A library for communicating with the Sinch Rest API'
  s.authors     = ['David Freiman']
  s.email       = 'dfreiman@feedbackapp.ca'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/davefreiman/sinch-ruby'
  s.metadata    = {
    'source_code_url' => 'https://github.com/davefreiman/sinch-ruby',
    'homepage_url'    => 'https://github.com/davefreiman/sinch-ruby'
  }
  s.required_ruby_version = '>= 2.0'
  s.license = 'MIT'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'activesupport', '~> 5.1'
  s.add_development_dependency 'vcr', '~> 4.0'
  s.add_development_dependency 'webmock', '~> 3.3'
  s.add_development_dependency 'simplecov', '~> 0.14.0'
  s.add_development_dependency 'rubocop', '~> 0.49.0'
  s.add_runtime_dependency 'httparty', '~> 0.15.6'
end
