include PermissionsHelper

def assign_all_permissions(user)
  all_actions.each do |action|
    FactoryBot.create(:permission, user: user, action: action)
  end
  user
end
