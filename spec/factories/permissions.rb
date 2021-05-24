FactoryBot.define do
  factory :permission do
    user
    action { "users#new" }
  end
end
