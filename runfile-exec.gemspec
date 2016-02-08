lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'runfile-exec/version'

Gem::Specification.new do |s|
  s.name        = 'runfile-exec'
  s.version     = RunfileExec::VERSION
  s.date        = Time.now.strftime "%Y-%m-%d"
  s.summary     = "Runfile methods for executing shell commands"
  s.description = "A collection of utility methods to run shell commands for Runfile"
  s.authors     = ["Danny Ben Shitrit"]
  s.email       = 'db@dannyben.com'
  s.files       = Dir['README.md', 'lib/**/*.rb']
  s.homepage    = 'https://github.com/DannyBen/runfile-exec'
  s.license     = 'MIT'

  s.add_runtime_dependency 'colsole', '~> 0.2'
  s.add_development_dependency 'run-gem-dev', '~> 0.2'
  s.add_development_dependency 'runfile', '~> 0.5'
  s.add_development_dependency 'minitest', '~> 5'
end
