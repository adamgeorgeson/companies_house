# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'companies_house/version'

Gem::Specification.new do |spec|
  spec.name          = "companies_house_client"
  spec.version       = CompaniesHouse::VERSION
  spec.authors       = ['Adam Georgeson']
  spec.email         = ['adamgeorgeson89@gmail.com']

  spec.summary       = %q{Client gem to interface with the Companies House API}
  spec.description   = %q{Client gem to interface with the Companies House API}
  spec.homepage      = 'https://github.com/adamgeorgeson/companies_house_client'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mysql"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'

  rails_version = "~> 3.2.18"
  spec.add_dependency "rails", rails_version
  spec.add_dependency "activesupport", rails_version

  spec.add_dependency "httparty"
end
