class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :city, :state, :about_me, :address, :image_url, :host, :personal_urls, :messages


  has_many :listings

end


