FactoryBot.define do
  factory :site_visitor do
    sequence(:name) { |index| "name-#{index}" }
    sequence(:country) { |index| "country-#{index}" }
    browser
  end
end
