class Permission < ApplicationRecord
  belongs_to :user
  validates :action, presence: true, uniqueness: { scope: :user_id }
end
