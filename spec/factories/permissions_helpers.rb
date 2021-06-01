def assign_all_permissions(user)
  Permission.all_actions.each do |action|
    FactoryBot.create(:permission, user: user, action: action)
  end
  user
end
