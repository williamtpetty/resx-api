class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :city, :state, :about_me, :image_url

  has_many :listings
end


