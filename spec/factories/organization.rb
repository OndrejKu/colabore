FactoryGirl.define do
  factory :organization do
    name { FFaker::Name.name }
    phone { FFaker::PhoneNumber.phone_number }
    description { FFaker::Lorem.sentence }
    address { FFaker::AddressBR.street }
    association :user
    association :city
  end
end
