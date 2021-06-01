FactoryBot.define do
  factory :stock_investment do
    investor
    stock_name { "GOOGL" }
    shares_owned { 2.5 }
  end
end
