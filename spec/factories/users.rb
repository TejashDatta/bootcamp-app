FactoryBot.define do
  factory :user do
    sequence(:name) { |index| "name-#{index}" }
    sequence(:email) { |index| "t_datta+test-#{index}@ga-tech.co.jp" }
    password { "password" }
  end
end
