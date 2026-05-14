# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-05-14

### Added
- `lib/localized_each_validator/version.rb` exposing
  `LocalizedEachValidator::VERSION`.
- `CHANGELOG.md` (this file).
- `bin/console` and `bin/setup` scripts following the `bundle gem`
  convention.
- GitHub Actions CI matrix (`.github/workflows/ci.yml`) running RSpec
  against Ruby 3.1, 3.2, 3.3, 3.4 and ActiveModel 7.0, 7.1, 7.2, 8.0.

### Changed
- **BREAKING:** Minimum Ruby version is now 3.1 (was 2.5).
- **BREAKING:** Minimum ActiveModel version is now 6.1 (was 3.0).
- Replaced the jeweler-generated gemspec with a hand-written gemspec
  following the `bundle gem` convention.
- The gem now depends on `activemodel` only; the explicit
  `activesupport` dependency was dropped (it is pulled in transitively
  by ActiveModel).
- `Gemfile` simplified to a single `gemspec` directive.
- `Rakefile` rewritten to default to `:spec` without jeweler/yard.
- `README.md` rewritten to drop Rails 3 framing, fix the incorrect
  superclass in the example, and document `:allow_nil`, `:allow_blank`,
  and `:message` options.

### Removed
- **BREAKING:** The `VERSION` plain-text file is gone. Read
  `LocalizedEachValidator::VERSION` instead.
- Removed jeweler, RedCloth, yard and the related development tooling.
- Removed `.travis.yml`.

### Fixed
- Gemspec referenced a non-existent `README.textile` file in `s.files`
  and `s.extra_rdoc_files`; the actual file is `README.md`.
- Gemspec contained a dead `if respond_to?(:specification_version)`
  fallback branch with duplicate `yard` entries and a missing `rspec`
  dependency. The whole branch is gone.
- `README.md` example showed `class FourValidator < ActiveRecord::EachValidator`;
  it now correctly subclasses `LocalizedEachValidator`.
