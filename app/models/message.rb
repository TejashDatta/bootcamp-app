class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates_presence_of :sender, :receiver, :subject, :content
  validates_length_of :subject, maximum: 250
  validates_length_of :content, maximum: 2000

  def party?(user)
    sender == user || receiver == user
  end
end
