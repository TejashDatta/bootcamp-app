class User < ApplicationRecord
  has_many :permissions, dependent: :destroy
  has_many :traveler_accounts, class_name: "Traveler", dependent: :destroy
  has_many :investor_accounts, class_name: "Investor", dependent: :destroy
  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message"

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
