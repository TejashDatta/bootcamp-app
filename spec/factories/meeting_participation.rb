FactoryBot.define do
  factory :meeting_participation do
    meeting
    user
    manager { false }
  end
end
