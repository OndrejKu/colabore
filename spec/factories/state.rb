FactoryGirl.define do
  factory :state do
    name "Rio de Janeiro"
    acronym "RJ"
    association :region
  end
end
