# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth-ofiplat/version'

Gem::Specification.new do |s|
  s.name        = 'omniauth-ofiplat'
  s.version     = OmniAuth::OfiPlat::VERSION
  s.authors     = ['OfiPlat']
  s.email       = ['ajimenez@ofi.com']
  s.homepage    = 'https://github.com/ofiplat/omniauth-ofiplat'
  s.summary     = 'Omniauth OAuth2 strategy for the OfiPlat platform.'
  s.description = %q{OfiPlat is an authentication broker that supports social identity providers as well as enterprise identity providers such as Active Directory, LDAP, Google Apps, Salesforce.

OmniAuth is a library that standardizes multi-provider authentication for web applications. It was created to be powerful, flexible, and do as little as possible.

omniauth-ofiplat is the omniauth strategy for OfiPlat.
}

  s.rubyforge_project = 'omniauth-ofiplat'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split('\n').map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.4'

  s.add_development_dependency 'bundler', '~> 1.9'
  
  s.license = 'MIT'
end
