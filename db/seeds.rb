require "factory_bot_rails"

a_endo = FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp")
assign_all_permissions(a_endo)
FactoryBot.create(:health_information, user: a_endo)

FactoryBot.create_list(:user, 10)
