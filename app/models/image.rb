class Image < ApplicationRecord

  validates :listing_id, :url, presence: true
  # validates :listing_id, numericality: true # not sure on this one

  belongs_to :listing
end
