FactoryBot.define do
  factory :employee do
    name { ["Rose", "Mary Jane", "James Parker", "Peter"].sample }
    date_of_joining { rand(500).days.from_now }
    department { %w[Marketing Sales Development].sample }
  end
end
