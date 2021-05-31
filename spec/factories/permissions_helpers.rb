def assign_permissions(user, actions_filter: //)
  Permission
    .all_actions
    .select { |action| actions_filter.match?(action) }
    .each { |action| FactoryBot.create(:permission, user: user, action: action) }
  user
end
