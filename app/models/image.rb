class Image < ApplicationRecord

  validates :listing_id, :url, presence: true

  belongs_to :listing
end
