lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'genderdetector/version'

Gem::Specification.new do |s|
  s.name = "genderdetector"
  s.version = GenderDetector::VERSION
  s.authors = ["Timothy G."]
  s.email = ["timgoatse@gmail.com"]
  s.description = "Get gender from first name."
  s.summary = "Get gender from first name."
  s.files = `git ls-files`.split($/)
  s.homepage = "https://github.com/AUTOMATICxx/genderdetector"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0")
  s.add_dependency('unicode_utils', '>= 1.3.0')
  s.add_dependency('db_nazi', '>= 0.0.5')
  s.add_development_dependency('minitest')
  s.add_development_dependency("rake")
  s.add_development_dependency("rdoc")
end
