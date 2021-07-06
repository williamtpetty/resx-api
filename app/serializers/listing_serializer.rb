class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :address, :latitude, :longitude, :availability, :price, :created_at

  has_many :images
  belongs_to :user
end

