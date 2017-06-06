FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password}
    kind "Volunteer"

    trait :kind_volunteer do
      kind "Volunteer"
    end

    trait :kind_organization do
      kind "Organization"
    end
  end
end
