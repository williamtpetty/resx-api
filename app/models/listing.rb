class Listing < ApplicationRecord

  belongs_to :user
  has_many :images, dependent: :destroy
  
  validates :title, :description, :address, presence: true
  validates :description, length: { in: 100..10000 }
  # validates :description, length: { maximum: 1500, too_long: "1500 characters is the maximum allowed"}

end
