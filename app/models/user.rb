class User < ApplicationRecord

  has_many :listings, dependent: :destroy
  has_many :personal_urls, dependent: :destroy
  has_many :messages

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }
  # validates :password, length: { minimum: 6 }

  
end
