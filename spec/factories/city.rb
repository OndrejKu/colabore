FactoryGirl.define do
  factory :city do
    name { FFaker::AddressBR.city }
    capital false
    association :state
  end
end
