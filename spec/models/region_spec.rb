require 'rails_helper'

RSpec.describe Region, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:region)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:name) }
  end
end
