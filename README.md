Localized `EachValidator`
=========================

|             |                                 |
|:------------|:--------------------------------|
| **Author**  | Tim Morgan                      |
| **Version** | 1.0.3 (Jul 23, 2013)            |
| **License** | Released under the MIT license. |

About
-----

Localized `EachValidator` is a subclass of ActiveRecord's `EachValidator` that
makes it easier to write a localized validator with Rails 3's localization. It's
small and simple.

Usage
-----

Add this gem to your project's `Gemfile`, or to your own validator gem's
dependencies. Then, sublass `LocalizedEachValidator` and provide the `error_key`
and override the `valid?` method, like so:

```` ruby
class FourValidator < ActiveRecord::EachValidator
  error_key :must_be_four

  def valid?(record, field, value)
    value == 4
  end
````

Now, users of your validator can create a localization YAML file like so:

```` yaml
en:
  activerecord:
	errors:
	  messages:
	    must_be_four: This number must be four.
````


See the {LocalizedEachValidator} class documentation for more information.
