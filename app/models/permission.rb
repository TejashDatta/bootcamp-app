class Permission < ApplicationRecord
  belongs_to :user
  validates :action, presence: true, uniqueness: { scope: :user_id }

  def self.all_actions
    Rails.application.eager_load!
    ApplicationController
      .subclasses
      .map { |controller|
        controller.action_methods.map { |action| "#{controller.controller_name}##{action}" }
      }
      .flatten
      .sort
  end
end
