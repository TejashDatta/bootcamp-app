require "factory_bot_rails"

assign_all_permissions(
  FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp")
)
FactoryBot.create_list(:user, 10)
