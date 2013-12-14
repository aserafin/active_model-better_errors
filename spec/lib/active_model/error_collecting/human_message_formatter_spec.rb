require "spec_helper"

describe ActiveModel::ErrorCollecting::HumanMessageFormatter do
  include_context "example model"

  let(:formatter) { described_class.new(model, error_message) }
  let(:error_message) do
    ActiveModel::ErrorCollecting::ErrorMessage.build(model, attribute, message)
  end

  describe "#format_message" do
    let(:format_message) { formatter.format_message }

    it "includes the message 'is invalid'" do
      expect(format_message).to include("is invalid")
    end
  end
end
