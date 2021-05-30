def assign_all_permissions(user)
  Permission.all_actions.each do |action|
    create_permission_for_user(user, action)
  end
  user
end

def assign_controller_permissions(user, controller)
  controller
    .action_methods
    .map { |action| "#{controller.controller_name}##{action}" }
    .each { |action| create_permission_for_user(user, action) }
  user
end

def create_permission_for_user(user, action)
  FactoryBot.create(:permission, user: user, action: action)
end
