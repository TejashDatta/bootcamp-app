class User < ApplicationRecord
  has_many :permissions, dependent: :destroy
  has_many :traveler_accounts, class_name: "Traveler", dependent: :destroy
  has_many :investor_accounts, class_name: "Investor", dependent: :destroy
  has_many :meeting_participations
  has_many :meetings, through: :meeting_participations
  
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true

  def permission?(action)
    permissions.find_by(action: action)
  end

  def permit_actions(actions)
    transaction do
      permissions.clear
      actions.each do |action|
        permissions.create(action: action)
      end
    end
  end
end
