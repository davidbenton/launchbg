# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'launchbg/version'

Gem::Specification.new do |spec|
  spec.name          = "launchbg"
  spec.version       = Launchbg::VERSION
  spec.authors       = ["Manuel Bahamondez Honores"]
  spec.email         = ["manuel@bahamondez.com"]
  spec.description   = %q{Permite iniciar commando del sistema operativo en background y retorna inmediatamente. Si Rails.env.production? entonces utiliza Heroku::API para iniciar un "one-off dyno" para procesar el trabajo}
  spec.summary       = %q{Permite iniciar commando del sistema operativo en background}
  spec.homepage      = "http://www.b9.cl"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "heroku-api"
end
