# frozen_string_literal: true

# Read the version constant from lib/localized_each_validator/version.rb without
# requiring the file (which would force `active_model` to be loaded during
# gemspec evaluation, before dependencies are installed).
version = File.read(File.expand_path("lib/localized_each_validator/version.rb", __dir__))
           .match(/VERSION\s*=\s*["']([^"']+)["']/)[1]

Gem::Specification.new do |spec|
  spec.name        = "localized_each_validator"
  spec.version     = version
  spec.authors     = ["Tim Morgan"]
  spec.email       = ["git@timothymorgan.info"]

  spec.summary     = "Simple EachValidator with localization support"
  spec.description = "Adds an abstract EachValidator superclass that you can use to create localizable validations."
  spec.homepage    = "https://github.com/RISCfuture/localized_each_validator"
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "homepage_uri"          => spec.homepage,
    "source_code_uri"       => "https://github.com/RISCfuture/localized_each_validator/tree/master",
    "changelog_uri"         => "https://github.com/RISCfuture/localized_each_validator/blob/master/CHANGELOG.md",
    "bug_tracker_uri"       => "https://github.com/RISCfuture/localized_each_validator/issues",
    "rubygems_mfa_required" => "true"
  }

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").select { |f| File.exist?(f) }.reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github .idea Gemfile])
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">= 6.1"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", ">= 1.0"
end
