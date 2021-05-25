class User < ApplicationRecord
  has_many :permissions, dependent: :destroy
  has_one :health_information, dependent: :destroy
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true

  def permission?(action)
    permissions.find_by(action: action)
  end
end
