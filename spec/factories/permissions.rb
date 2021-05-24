FactoryBot.define do
  factory :permission do
    user
    action { "user#new" }
  end
end
