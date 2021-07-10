class User < ApplicationRecord

  has_many :listings, dependent: :destroy
  has_many :personal_urls, dependent: :destroy

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

  # How will this effect signup?
  #validates :first_name, :last_name, :address, :city, :state, :zip_code presence: true 
  
end
