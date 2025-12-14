$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your wagon's version:
require "hitobito_generic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable Style/SingleSpaceBeforeFirstArg
  s.name = "hitobito_generic"
  s.version = HitobitoGeneric::VERSION
  s.authors = ["Alumni ED"]
  s.email = ["it@alumni-ed.ch"]
  s.homepage = "http://alumni-ed.ch"
  s.summary = "Generic wagon for Alumni ED"
  s.description = "Generic wagon for Alumni ED"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  # rubocop:enable Style/SingleSpaceBeforeFirstArg
end
