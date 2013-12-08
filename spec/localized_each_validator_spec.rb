require 'spec_helper'
require 'active_model'

module SpecSupport
  class TestLocalizedEachValidator < LocalizedEachValidator
    def valid?(_,_, v) v == 'foo' end
  end
  class FakeModel
    extend ActiveModel::Translation
    def errors() @errors ||= ActiveModel::Errors.new(self) end
    def self.lookup_ancestors() [ self ] end
    def read_attribute_for_validation(_) "mock" end
  end
end

describe LocalizedEachValidator do
  before :each do
    @model = SpecSupport::FakeModel.new
  end

  describe ".error_key_prefix" do
    it "should be the downcased name of the validator by default" do
      expect(SpecSupport::TestLocalizedEachValidator.error_key).to eql(:test_localized_each)
    end

    it "should be able to be set" do
      SpecSupport::TestLocalizedEachValidator.error_key(:foo)
      expect(SpecSupport::TestLocalizedEachValidator.error_key).to eql(:foo)
      SpecSupport::TestLocalizedEachValidator.instance_variable_set :@error_key, nil
    end
  end

  describe ".validate_each" do
    it "should do nothing if given nil and :allow_nil is set" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field, allow_nil: true).validate_each(@model, :field, nil)
      expect(@model.errors).to be_empty
    end

    it "should do nothing if given a blank value and :allow_blank is set" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field, allow_blank: true).validate_each(@model, :field, "")
      expect(@model.errors).to be_empty
    end

    it "should validate according to the #valid? method" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field).validate_each(@model, :field, "foo")
      expect(@model.errors).to be_empty
    end

    it "should add an error if the validation fails" do
      SpecSupport::TestLocalizedEachValidator.new(attributes: :field).validate_each(@model, :field, "bar")
      expect(@model.errors[:field]).not_to be_empty
      expect(@model.errors[:field].first).to include('test_localized_each')
    end
  end
end
