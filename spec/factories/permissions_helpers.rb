def assign_permissions(user, action_filter: //)
  Permission
    .all_actions
    .select { |action| action_filter.match?(action) }
    .each { |action| FactoryBot.create(:permission, user: user, action: action) }
  user
end
