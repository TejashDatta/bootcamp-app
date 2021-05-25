module PermissionsHelper
  def all_actions
    Rails.application.eager_load!
    ApplicationController
      .subclasses
      .map { |controller|
        controller.action_methods.map { |action| "#{controller.controller_name}##{action}" }
      }.flatten
  end
end
