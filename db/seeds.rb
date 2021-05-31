require "factory_bot_rails"

assign_permissions(
  FactoryBot.create(:user, name: "a endo", email: "a_endo@ga-tech.co.jp", password: "a_endo@ga-tech.co.jp")
)
FactoryBot.create_list(:user, 10)

FactoryBot.create(:investor)
FactoryBot.create(:technology, name: "ruby")
FactoryBot.create(:technology, name: "rails")
FactoryBot.create(:technology, name: "python")
