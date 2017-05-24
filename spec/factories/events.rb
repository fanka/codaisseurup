FactoryGirl.define do
  factory :event do
    name              "Event"
    location          { Faker::Address.street_address }
    description       { Faker::Lorem.sentence(40) }
    price             { Faker::Commerce.price }
    capacity          2
    starts_at         { Faker::Time.forward(23, :morning) }
    ends_at           { Faker::Time.forward(23, :evening) }
    includes_food     true
    includes_drinks   true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
