require 'rails_helper'

RSpec.describe State, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:state)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:name) }
    it {is_expected.to validate_presence_of(:acronym) }
    it {is_expected.to validate_presence_of(:region) }
  end
end
