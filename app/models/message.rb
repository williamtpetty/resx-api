class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, length: { in: 1..10000 }
end
