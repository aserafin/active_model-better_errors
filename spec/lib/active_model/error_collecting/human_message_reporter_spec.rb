require "spec_helper"

describe ActiveModel::ErrorCollecting::HumanMessageReporter do
  include_context "example model"
  include_context "error collection"

  include_examples "reporter#base"

  describe "#full_message" do
    let(:attribute) { :first_name }
    let(:message) { "is invalid" }
    let(:full_message) { reporter.full_message(attribute, message) }

    it "includes the attribute, humanized" do
      expect(full_message).to include("First name")
    end

    it "includes the message" do
      expect(full_message).to include("is invalid")
    end
  end

  describe "#full_messages" do
    let(:full_messages) { reporter.full_messages }
    let(:first_name_invalid) { "First name is invalid" }
    let(:last_name_invalid) { "Last name is invalid" }
    let(:first_name_short) { "First name is too short (minimum is 3 characters)" }

    it "includes the invalid first name message" do
      expect(full_messages).to include(first_name_invalid)
    end

    it "includes the invalid last name message" do
      expect(full_messages).to include(last_name_invalid)
    end

    it "includes the too short first name message" do
      expect(full_messages).to include(first_name_short)
    end
  end

  describe "#generate_message" do
    let(:attribute) { :first_name }
    let(:generate_message) { reporter.generate_message(attribute, type, options) }

    context "when passing symbols as message" do
      let(:type) { :too_short }
      let(:options) { { count: 3 } }
      let(:message) { "is too short (minimum is 3 characters)" }

      it "includes the message" do
        expect(generate_message).to include(message)
      end
    end

    context "when passing strings as message" do
      let(:type) { "foo" }
      let(:options) { nil }
      let(:message) { type }

      it "includes the message" do
        expect(generate_message).to include(message)
      end
    end
  end
end
