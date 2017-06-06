require 'rails_helper'

RSpec.describe Review, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:review, :review_organization)).to be_valid
    expect(FactoryGirl.create(:review, :review_volunteer)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:reviewable) }
    it {is_expected.to validate_presence_of(:reviewable_type) }
    it {is_expected.to validate_presence_of(:note) }
  end
end
