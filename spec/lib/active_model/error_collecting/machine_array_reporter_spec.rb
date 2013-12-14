require "spec_helper"

describe ActiveModel::ErrorCollecting::MachineArrayReporter do
  include_context "example model"
  include_context "error collection"

  include_examples "reporter#base"

  describe "#to_a" do
    let(:to_a) { reporter.to_a }
    let(:array) do
      [
        {
          attribute: "first_name",
          type: :invalid
        },
        {
          attribute: "first_name",
          type: :too_short,
          options: {
            count: 3
          }
        },
        {
          attribute: "last_name",
          type: :invalid
        }
      ]
    end

    it "returns the array" do
      expect(to_a).to eq(array)
    end
  end
end
