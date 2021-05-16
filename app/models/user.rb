class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
