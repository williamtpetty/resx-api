class ImageSerializer < ActiveModel::Serializer
  attributes :id, :listing_id, :url

  # belongs_to :listing
end
