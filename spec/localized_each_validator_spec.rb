# frozen_string_literal: true

require "spec_helper"
require "active_model"

module SpecSupport
  class TestLocalizedEachValidator < LocalizedEachValidator
    def valid?(_, _, v) = v == "foo"
  end

  class FakeModel
    extend ActiveModel::Translation
    extend ActiveModel::Naming
    def errors = @errors ||= ActiveModel::Errors.new(self)
    def self.lookup_ancestors = [self]
    def read_attribute_for_validation(_) = "mock"
  end
end

RSpec.describe LocalizedEachValidator do
  before :each do
    @model = SpecSupport::FakeModel.new
  end

  describe ".error_key_prefix" do
    it "is the downcased name of the validator by default" do
      expect(SpecSupport::TestLocalizedEachValidator.error_key).to be(:test_localized_each)
    end

    it "is able to be set" do
      SpecSupport::TestLocalizedEachValidator.error_key(:foo)
      expect(SpecSupport::TestLocalizedEachValidator.error_key).to be(:foo)
      SpecSupport::TestLocalizedEachValidator.instance_variable_set :@error_key, nil
    end
  end

  describe ".validate_each" do
    it "does nothing if given nil and :allow_nil is set" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field, allow_nil: true).validate_each(@model, :field, nil)
      expect(@model.errors).to be_empty
    end

    it "does nothing if given a blank value and :allow_blank is set" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field, allow_blank: true).validate_each(@model, :field, "")
      expect(@model.errors).to be_empty
    end

    it "validates according to the #valid? method" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field).validate_each(@model, :field, "foo")
      expect(@model.errors).to be_empty
    end

    it "adds an error if the validation fails" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field).validate_each(@model, :field, "bar")
      expect(@model.errors[:field]).not_to be_empty
      expect(@model.errors[:field].first).to include("test_localized_each")
    end
  end
end
