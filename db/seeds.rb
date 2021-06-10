require "factory_bot_rails"

a_endo = FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp")
user_1 = FactoryBot.create_list(:user, 75)[0]

[a_endo, user_1].each do |user|
  assign_permissions(user)

  FactoryBot.create(:traveler, account_user: user)
  FactoryBot.create(:passport, traveler: FactoryBot.create(:traveler, account_user: user))

  FactoryBot.create(:stock_investment, investor: FactoryBot.create(:investor, account_user: user))
end

FactoryBot.create(:technology, name: "ruby")
FactoryBot.create(:technology, name: "rails")
FactoryBot.create(:technology, name: "python")

FactoryBot.create_list(:employee, 100)
