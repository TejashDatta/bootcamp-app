FactoryBot.define do
  factory :message do
    sender { association :user }
    receiver { association :user }
    sequence(:subject) { |index| "Subject-#{index}" }
    sequence(:content) { |index| "Messsage content #{index}" }
  end
end
