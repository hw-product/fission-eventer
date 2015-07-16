$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'fission-eventer/version'
Gem::Specification.new do |s|
  s.name = 'fission-eventer'
  s.version = Fission::Eventer::VERSION.version
  s.summary = 'Fission Eventer'
  s.author = 'Heavywater'
  s.email = 'fission@hw-ops.com'
  s.homepage = 'http://github.com/hw-product/fission-eventer'
  s.description = 'Fission Eventer'
  s.require_path = 'lib'
  s.add_runtime_dependency 'fission', '>= 0.2.4', '< 1.0.0'
  s.add_runtime_dependency 'fission-data', '>= 0.2.11', '< 1.0.0'
  s.files = Dir['{lib}/**/**/*'] + %w(fission-eventer.gemspec README.md CHANGELOG.md)
end
