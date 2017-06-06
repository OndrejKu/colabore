require 'rails_helper'

RSpec.describe Volunteer, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:volunteer)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:name) }
    it {is_expected.to validate_presence_of(:phone) }
    it {is_expected.to validate_presence_of(:user) }
    it {is_expected.to validate_presence_of(:city) }
  end
end
