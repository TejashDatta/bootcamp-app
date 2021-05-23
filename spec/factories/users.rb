FactoryBot.define do
  factory :user do
    sequence(:name) { |index| "name-#{index}" }
    sequence(:email) { |index| "email-#{index}@gmail.com" }
    password { "password" }
    role { "general" }

    trait :admin do
      role { "admin" }
    end

    trait :manager do
      role { "manager" }
    end

    factory :admin_user, traits: %i[admin]
    factory :manager_user, traits: %i[manager]
  end
end
