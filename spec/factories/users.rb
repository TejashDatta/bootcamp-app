FactoryBot.define do
  factory :user do
    sequence(:name) { |index| "name-#{index}" }
    sequence(:email) { |index| "email-#{index}@gmail.com" }
    password { "password" }
    role { "general" }
  end
end
