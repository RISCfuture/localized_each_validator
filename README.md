# Localized `EachValidator`

[![CI](https://github.com/RISCfuture/localized_each_validator/actions/workflows/ci.yml/badge.svg)](https://github.com/RISCfuture/localized_each_validator/actions/workflows/ci.yml)
[![Gem Version](https://img.shields.io/gem/v/localized_each_validator.svg)](https://rubygems.org/gems/localized_each_validator)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

|             |                                 |
| :---------- | :------------------------------ |
| **Author**  | Tim Morgan                      |
| **License** | Released under the MIT license. |

## About

`LocalizedEachValidator` is a small abstract subclass of
`ActiveModel::EachValidator` that makes it easy to write validators whose
error messages are looked up through Rails / ActiveModel's I18n
infrastructure.

Subclass `LocalizedEachValidator`, declare an `error_key`, and implement
`#valid?`. The validator adds the error key to the record's errors when a
value fails validation; ActiveModel will then resolve that key against the
standard I18n error message hierarchy.

## Installation

Add to your `Gemfile`:

```ruby
gem "localized_each_validator"
```

Or, if you're writing your own validator gem, add it to your gemspec:

```ruby
spec.add_dependency "localized_each_validator", "~> 2.0"
```

Then run `bundle install`.

## Usage

Subclass `LocalizedEachValidator`, set an `error_key`, and implement
`#valid?`:

```ruby
class FourValidator < LocalizedEachValidator
  error_key :must_be_four

  def valid?(record, attribute, value)
    value == 4
  end
end
```

Users of your validator can then add a translation:

```yaml
en:
  activemodel:
    errors:
      messages:
        must_be_four: "must be four"
```

### Options

`LocalizedEachValidator` honors the standard `EachValidator` options:

* `:allow_nil` — skip validation when the value is `nil`.
* `:allow_blank` — skip validation when the value is blank.
* `:message` — override the default `error_key`-based error message with
  a literal string or another symbol.

### Default `error_key`

If you don't call `error_key`, the default is derived from the class
name: the trailing `Validator` is stripped, the result is demodulized,
and `underscore`d. For example, `Auth::EmailAddressValidator` defaults
to `:email_address`.

See the `LocalizedEachValidator` class documentation for more details.
