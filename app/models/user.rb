class User < ApplicationRecord

  has_many :listings, dependent: :destroy
  has_many :personal_urls, dependent: :destroy
  has_many :messages
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }

  def conversations
    Conversation.where("sender_id = ? OR receiver_id = ?", id, id)
  end
end
