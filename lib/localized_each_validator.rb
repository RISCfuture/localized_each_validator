require 'active_support/core_ext/hash/except'
require 'active_model/validator'

# An `EachValidator` that uses the translation table to build its error
# messages. Override the {#valid?} method to describe your validation
# conditions of your subclasses.
#
# The error message translation lookups conform to the standard hierarchy of
# internationalization keys as described by the
# `ActiveRecord::Errors#generate_message` method. (See its documentation for
# more information.) The last portion of the translation key path is the error
# message key, and by default it is the name of the validator class (excepting
# "Validator"), underscored and demodulized. For example, an
# `EmailAddressValidator` subclass would use the `email_address` key within the
# normal ActiveRecord error key structure.
#
# @abstract Subclass this validator to perform your specific validations.

class LocalizedEachValidator < ActiveModel::EachValidator
  # @private
  def validate_each(record, attribute, value)
    return if options[:allow_nil] and value.nil?
    return if options[:allow_blank] and value.blank?
    record.errors.add(attribute, options[:message] || self.class.error_key) unless valid?(record, attribute, value)
  end

  protected

  # @abstract Override this method to return true or false depending on whether
  #   `value` is a valid value for `record`'s `attribute`.
  # @param [ActiveRecord::Base] record The record being validated.
  # @param [Symbol] attribute The attribute with the given value.
  # @param value The value of the attribute to be validated.
  # @return [true, false] Whether the value is valid.

  def valid?(record, attribute, value)
    raise NotImplementedError, "Implement this method in your subclasses"
  end

  # @overload error_key
  #   Returns the error message key this class uses.
  #   @return [Symbol] The error message key.
  #
  # @overload error_key(value)
  #   Sets the error message key this class uses.
  #   @param [Symbol] value The new error message key.

  def self.error_key(value=nil)
    if value then
      @error_key = value
    else
      return @error_key || to_s.demodulize.sub(/Validator$/, '').underscore.to_sym
    end
  end
end
