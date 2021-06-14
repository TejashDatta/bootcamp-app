FactoryBot.define do
  factory :citizen do
    sequence(:name) { |index| "Name-#{index}" }
    city { %w[Nagoya Tokyo Sapporo Osaka].sample }
  end
end
