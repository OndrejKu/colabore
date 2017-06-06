FactoryGirl.define do
  factory :review do
      trait :review_organization do
        association :reviewable, factory: :organization
        reviewable_type 'Organization'
      end

      trait :review_volunteer do
        association :reviewable, factory: :volunteer
        reviewable_type 'Volunteer'
      end

      note { rand(1..10) }
      description { FFaker::Lorem.sentence }
  end
end
