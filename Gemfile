# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in localized_each_validator.gemspec
gemspec

# Allow CI to pin a specific ActiveModel minor series (e.g. "7.1", "8.0").
if (activemodel_version = ENV["ACTIVEMODEL_VERSION"])
  gem "activemodel", "~> #{activemodel_version}.0"
end
