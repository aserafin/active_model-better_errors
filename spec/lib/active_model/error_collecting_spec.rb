require 'spec_helper'

describe ActiveModel::ErrorCollecting do
  let(:reporters) { described_class.reporters }

  describe ".set_reporter" do
    let(:name) { "foo" }
    let(:reporter) { Class.new }

    before(:each) do
      ActiveModel::ErrorCollecting.set_reporter(name, reporter)
    end

    after(:each) do
      ActiveModel::ErrorCollecting.set_reporter(name, nil)
    end

    it "adds the reporter to the reporters" do
      expect(reporters[name]).to eq(reporter)
    end
  end

  describe ".reporters" do
    let(:hash) do
      {
        'message' => ActiveModel::ErrorCollecting::HumanMessageReporter,
        'array' => ActiveModel::ErrorCollecting::HumanArrayReporter,
        'hash' => ActiveModel::ErrorCollecting::HumanHashReporter
      }
    end

    it "returns the reporters hash" do
      expect(reporters).to eq(hash)
    end
  end
end
