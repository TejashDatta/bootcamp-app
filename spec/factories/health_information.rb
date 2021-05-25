FactoryBot.define do
  factory :health_information do
    user
    height_in_cm { 200.1 }
    weight_in_kg { 70.5 }
  end
end
