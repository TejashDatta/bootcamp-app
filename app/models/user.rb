class User < ApplicationRecord
  has_many :permissions, dependent: :destroy
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true

  def permission?(action)
    permissions.each do |permission|
      return true if permission.action == action
    end
    false
  end
end
