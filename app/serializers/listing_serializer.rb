class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :address, :availability, :price

  belongs_to :user
end

