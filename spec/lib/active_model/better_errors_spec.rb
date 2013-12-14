require 'spec_helper'

describe "ActiveModel Better Errors" do
  let(:user) { User.new }
  let(:errors) { user.errors }

  it "overrides ActiveModel Validations" do
    expect(errors).to be_a(ActiveModel::ErrorCollecting::Errors)
  end
end
