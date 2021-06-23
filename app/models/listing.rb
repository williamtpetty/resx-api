class Listing < ApplicationRecord

  belongs_to :user
  has_many :images
  
  validates :title, :description, :address, presence: true
  # validates :description, length: { maximum: 1500, too_long: "1500 characters is the maximum allowed"}

end
