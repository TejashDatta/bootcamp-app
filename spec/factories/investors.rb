FactoryBot.define do
  factory :investor do
    sequence(:account_number) { |index| "AC000#{index}" }
    balance_in_yen { 1500 }
  end
end
