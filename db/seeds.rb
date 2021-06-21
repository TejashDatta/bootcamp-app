require "factory_bot_rails"

assign_permissions(
  FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp")
)
user_1, user_2 = FactoryBot.create_list(:user, 75)[0..1]

[user_1, user_2].each do |user|
  assign_permissions(user)

  FactoryBot.create(:traveler, account_user: user)
  FactoryBot.create(:passport, traveler: FactoryBot.create(:traveler, account_user: user))

  FactoryBot.create(:stock_investment, investor: FactoryBot.create(:investor, account_user: user))
end

FactoryBot.create_list(:message, 15, sender: user_1)
FactoryBot.create_list(:message, 15, receiver: user_1)

FactoryBot.create(:technology, name: "ruby")
FactoryBot.create(:technology, name: "rails")
FactoryBot.create(:technology, name: "python")

FactoryBot.create_list(:employee, 100)
FactoryBot.create_list(:citizen, 10)

FactoryBot.create_list(:unnormalized_site_visitor, 5)

browsers = FactoryBot.create_list(:browser, 2)
platforms = FactoryBot.create_list(:platform, 2)

browsers.each do |browser|
  platforms.each do |platform|
    FactoryBot.create(:browser_compatibility, browser: browser, platform: platform)
  end
end

FactoryBot.create_list(:site_visitor, 6, browser: browsers.sample)
