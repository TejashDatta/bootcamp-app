require "factory_bot_rails"

FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp", role: "admin")
FactoryBot.create_list(:user, 10)
