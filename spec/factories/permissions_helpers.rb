def assign_all_permissions(user)
  FactoryBot.create(:permission, user: user, action: "users#new")
  FactoryBot.create(:permission, user: user, action: "users#create")
  FactoryBot.create(:permission, user: user, action: "permissions#new")
  FactoryBot.create(:permission, user: user, action: "permissions#create")
  user
end
