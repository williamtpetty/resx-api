class Listing < ApplicationRecord

  validates :title, :description, :address, presence: true

  belongs_to :user
  has_many :images

end
