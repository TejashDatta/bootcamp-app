FactoryBot.define do
  factory :unnormalized_site_visitor do
    sequence(:name) { |index| "name-#{index}" }
    sequence(:country) { |index| "country-#{index}" }
    sequence(:browser) { |index| "browser-#{index}" }
    sequence(:browser_developer) { |index| "developer-#{index}" }
    browser_platforms { "platform-1, platform-2, platform-3" }
  end
end
