class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :address, :latitude, :longitude, :availability, :price

  has_many :images
  belongs_to :user
end

