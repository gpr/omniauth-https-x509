# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-https-x509/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'omniauth', '~> 1.0'

  spec.name          = 'omniauth-https-x509'
  spec.version       = OmniAuth::HttpsX509::VERSION
  spec.authors       = ['Gregory Romé']
  spec.email         = ['gregory.rome@gmail.com']
  spec.description   = %q{HTTPS X509 strategy for OmniAuth}
  spec.summary       = %q{This strategy uses information provided by HTTP server when SSL client verification is performed}
  spec.homepage      = 'https://github.com/gpr/omniauth-https-x509-https-x509'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
