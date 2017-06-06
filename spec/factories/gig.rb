FactoryGirl.define do
  factory :gig do
      association :organization
      title { FFaker::Lorem.sentence }
      description { FFaker::Lorem.sentence }
      start_date FFaker::Time.between(1.days.from_now, 5.days.from_now)
      end_date FFaker::Time.between(10.days.from_now, 15.days.from_now)
      number_of_available_candidatures { rand(1..5) }
  end
end
