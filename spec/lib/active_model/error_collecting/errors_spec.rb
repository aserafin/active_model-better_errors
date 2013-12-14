require "spec_helper"

describe ActiveModel::ErrorCollecting::Errors do
  include_context "example model"

  let(:errors) { described_class.new(model) }
  let(:name) { "example_name" }
  let(:reporter) { double("Reporter") }

  describe "#error_collection" do
    let(:error_collection) { errors.error_collection }

    it "is a type of error collection" do
      expect(error_collection).to be_a(ActiveModel::ErrorCollecting::ErrorCollection)
    end
  end

  describe "#message_reporter" do
    let(:message_reporter) { errors.message_reporter }

    before(:each) do
      allow(errors).to receive(:get_reporter).with(:message).and_return(reporter)
    end

    it "returns the reporter" do
      expect(message_reporter).to be(reporter)
    end
  end

  describe "#hash_reporter" do
    let(:hash_reporter) { errors.hash_reporter }

    before(:each) do
      allow(errors).to receive(:get_reporter).with(:hash).and_return(reporter)
    end

    it "returns the reporter" do
      expect(hash_reporter).to be(reporter)
    end
  end

  describe "#array_reporter" do
    let(:array_reporter) { errors.array_reporter }

    before(:each) do
      allow(errors).to receive(:array).with(:hash).and_return(reporter)
    end

    it "returns the reporter" do
      expect(array_reporter).to be(reporter)
    end
  end

  describe "#set_reporter" do

    context "without an any set reporter class" do
      let(:reporter_classes) { errors.instance_variable_get(:@reporter_classes) }

      before(:each) do
        errors.set_reporter(name, reporter)
      end

      it "sets the reporter class" do
        expect(reporter_classes[name]).to eq(reporter)
      end
    end

    context "with an already set reporter class" do
      let(:reporters) { errors.instance_variable_get(:@reporters) }

      before(:each) do
        reporters[name] = mock("OldReporter")
        errors.set_reporter(name, reporter)
      end

      it "deletes old reporter instance" do
        expect(reporters).to_not have_key(name)
      end
    end
  end

  describe "#get_reporter_class" do
    let(:get_reporter_class) { errors.get_reporter_class(name) }

    before(:each) do
      errors.set_reporter(name, reporter)
    end

    it "returns the reporter class" do
      expect(get_reporter_class).to eq(reporter)
    end
  end

  describe "#get_reporter" do
    let(:get_reporter) { errors.get_reporter(name) }

    before(:each) do
      errors.set_reporter(name, reporter)
    end

    it "returns the reporter" do
      expect(get_reporter).to be(reporter)
    end
  end

  describe "#reporter_classes" do
    let(:repoter_classes) { errors.reporter_classes }

    it "returns the ActiveModel::ErrorColelctiong reporters" do
      expect(repoter_classes).to eq(::ActiveModel::ErrorCollecting.reporters)
    end
  end
end
