class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :city, :state, :about_me, :image_url, :host


  has_many :listings

end


