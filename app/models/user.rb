class User < ApplicationRecord

  has_many :listings

  has_secure_password
  validates :email, presence: true, uniqueness: true

  # How will this effect signup?
  #validates :first_name, :last_name, :address, :city, :state, :zip_code presence: true 
  
  

end
