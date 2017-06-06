require 'rails_helper'

RSpec.describe Gig, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:gig)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:organization) }
    it {is_expected.to validate_presence_of(:title) }
    it {is_expected.to validate_presence_of(:description) }
    it {is_expected.to validate_presence_of(:start_date) }
    it {is_expected.to validate_presence_of(:end_date) }
    it {is_expected.to validate_presence_of(:number_of_available_candidatures) }

    it {expect(:start_date).to be >= :end_date }
  end
end
