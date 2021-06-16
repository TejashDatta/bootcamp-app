FactoryBot.define do
  factory :meeting do
    sequence(:name) { |index| "Name-#{index}" }
    sequence(:description) { |index| "Description-#{index}" }
    start_at { rand(500).hours.from_now }
    end_at { start_at + rand(30..120).minutes }
  end
end
