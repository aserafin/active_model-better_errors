require 'spec_helper'

describe ActiveModel::ErrorCollecting::HumanHashReporter do
  include_context "example model"
  include_context "error collection"

  include_examples "reporter#base"

  describe "#to_hash" do
    let(:to_hash) { reporter.to_hash }
    let(:hash) do
      {
        first_name: ["is invalid", "is too short (minimum is 3 characters)"],
        last_name: ["is invalid"]
      }
    end

    it "returns the error hash" do
      expect(to_hash).to eq(hash)
    end
  end
end
