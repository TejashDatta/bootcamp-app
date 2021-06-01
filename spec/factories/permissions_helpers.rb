<<<<<<< HEAD
def assign_permissions(user, actions_filter: "")
  Permission
    .all_actions
    .select { |action| Regexp.new(actions_filter).match?(action) }
=======
def assign_permissions(user, actions_filter: //)
  Permission
    .all_actions
    .select { |action| actions_filter.match?(action) }
>>>>>>> bdac26f7cdad409b2c738972522be054b04c8385
    .each { |action| FactoryBot.create(:permission, user: user, action: action) }
  user
end
