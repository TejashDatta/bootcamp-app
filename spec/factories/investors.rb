FactoryBot.define do
  factory :investor do
    association :account_user, factory: :user
    sequence(:account_number) { |index| "AC000#{index}" }
    balance_in_yen { 1500 }
  end
end
