class MessageSearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :sender_email, :string
  attribute :receiver_email, :string
  attribute :subject, :string
  attribute :content, :string

  def initialize(user: nil, params: nil)
    super(params)
    @user = user
  end

  def search
    results = @user.sent_and_received_messages
    results = results.where(sender_id: User.find_by(email: sender_email)&.id) if sender_email.present?
    results = results.where(receiver_id: User.find_by(email: receiver_email)&.id) if receiver_email.present?
    results = results.where("subject LIKE ?", "%#{subject}%") if subject.present?
    results = results.where("content LIKE ?", "%#{content}%") if content.present?
    results
  end
end
