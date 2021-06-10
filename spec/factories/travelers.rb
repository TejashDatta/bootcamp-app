FactoryBot.define do
  factory :traveler do
    association :account_user, factory: :user
    name { "John" }
    departure_country { "Portugal" }
    arrival_country { "Japan" }
  end
end
