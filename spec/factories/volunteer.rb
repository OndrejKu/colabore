FactoryGirl.define do
  factory :volunteer do
    name { FFaker::Name.name }
    phone { FFaker::PhoneNumber.phone_number }
    bio { FFaker::Lorem.sentence }
    association :user
    association :city
  end
end
