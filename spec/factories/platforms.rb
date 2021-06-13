FactoryBot.define do
  factory :platform do
    sequence(:name) { |index| "platform-#{index}" }
  end
end
