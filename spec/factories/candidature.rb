FactoryGirl.define do
  factory :candidature do
    association :gig
    association :volunteer
    accepted true
    introduction_letter { FFaker::Lorem.sentence }
  end
end
