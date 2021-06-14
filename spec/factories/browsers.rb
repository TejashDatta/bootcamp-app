FactoryBot.define do
  factory :browser do
    sequence(:name) { |index| "browser-#{index}" }
    sequence(:developer) { |index| "developer-#{index}" }
  end
end
