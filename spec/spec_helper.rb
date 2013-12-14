require "coveralls"
Coveralls.wear! do
  add_filter "/spec/"
end

require "pry"
require "rspec"
require "active_model"
require "active_model/better_errors"

require_relative "support/models"

class String
  def ==(other)
    if other.is_a? ActiveModel::ErrorCollecting::ErrorMessage
      super other.to_s
    else
      super
    end
  end
end

shared_context "example model" do
  let(:model) { User.new }
end

shared_context "error collection" do
  let(:collection) { ActiveModel::ErrorCollecting::ErrorCollection.new(model) }
  let(:reporter) { described_class.new(collection) }

  before(:each) do
    collection[:first_name] << :invalid
    collection[:first_name] << [:too_short, { count: 3 }]
    collection[:last_name] << :invalid
  end
end

shared_examples "reporter#base" do
  describe "#base" do
    let(:base) { reporter.base }

    it "returns the model" do
      expect(base).to eq(model)
    end
  end
end
