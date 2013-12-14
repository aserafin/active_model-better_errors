require 'spec_helper'

describe ActiveModel::ErrorCollecting::HumanArrayReporter do
  include_context "example model"
  include_context "error collection"

  include_examples "reporter#base"

  describe "#to_a" do
    let(:to_a) { reporter.to_a }
    let(:array) { %w[foo bar] }
    let(:message_reporter) { double("MessageReporter") }

    before(:each) do
      expect(ActiveModel::ErrorCollecting::HumanMessageReporter).to receive(:new).and_return(message_reporter)
      expect(message_reporter).to receive(:full_messages).and_return(array)
    end

    it "returns an array" do
      expect(to_a).to eq(array)
    end
  end
end
