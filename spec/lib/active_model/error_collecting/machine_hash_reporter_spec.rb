require "spec_helper"

describe ActiveModel::ErrorCollecting::MachineHashReporter do
  include_context "example model"
  include_context "error collection"

  include_examples "reporter#base"

  describe "#to_hash" do
    let(:to_hash) { reporter.to_hash }
    let(:hash) do
      {
        first_name: [
          {
            type: :invalid
          },
          {
            type: :too_short,
            options: {
              count: 3
            }
          }
        ],
        last_name: [
          {
            type: :invalid
          }
        ]
      }
    end

    it "returns the hash" do
      expect(to_hash).to eq(hash)
    end
  end
end
