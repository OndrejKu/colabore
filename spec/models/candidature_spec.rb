require 'rails_helper'

RSpec.describe Candidature, type: :model do
  it "should has a valid factory" do
    expect(FactoryGirl.create(:candidature)).to be_valid
  end

  context "validations" do
    it {is_expected.to validate_presence_of(:gig) }
    it {is_expected.to validate_presence_of(:volunteer) }
  end
end
