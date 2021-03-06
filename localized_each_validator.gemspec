# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

# stub: localized_each_validator 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "localized_each_validator"
  s.version = "1.0.3"

  s.required_ruby_version = '>= 2.5'
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Morgan"]
  s.description = "Adds an abstract EachValidator superclass that you can use to create localizable validations."
  s.email = "git@timothymorgan.info"
  s.extra_rdoc_files = %w[LICENSE README.textile]
  s.files = %w[LICENSE README.textile lib/localized_each_validator.rb localized_each_validator.gemspec]
  s.homepage = "https://github.com/riscfuture/localized_each_validator"
  s.require_paths = %w[lib]
  s.rubygems_version = "2.1.11"
  s.summary = "Simple EachValidator with localization support"

  if s.respond_to? :specification_version
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0')
      s.add_runtime_dependency('activemodel', [">= 3.0"])
      s.add_runtime_dependency('activesupport', [">= 3.0"])
      s.add_development_dependency('jeweler', [">= 0"])
      s.add_development_dependency('RedCloth', [">= 0"])
      s.add_development_dependency('rspec', [">= 0"])
      s.add_development_dependency('yard', [">= 0"])
    else
      s.add_dependency('activemodel', [">= 3.0"])
      s.add_dependency('activesupport', [">= 3.0"])
      s.add_dependency('jeweler', [">= 0"])
      s.add_dependency('RedCloth', [">= 0"])
      s.add_dependency('rspec', [">= 0"])
      s.add_dependency('yard', [">= 0"])
    end
  else
    s.add_dependency('activemodel', [">= 3.0"])
    s.add_dependency('activesupport', [">= 3.0"])
    s.add_dependency('jeweler', [">= 0"])
    s.add_dependency('yard', [">= 0"])
    s.add_dependency('yard', [">= 0"])
    s.add_dependency('yard', [">= 0"])
  end
end
