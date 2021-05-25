FactoryBot.define do
  factory :passport do
    traveler
    passport_number { "PA0101" }
    nationality { "Japan" }
  end
end
