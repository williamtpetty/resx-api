require 'rails_helper'

RSpec.describe "Images", type: :request do
  before do
    user = User.create({first_name: "William", last_name: "Petty", email: "pettwil1131@gmail.com", phone_number: "5555555555", address: "1131 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Hey I'm Will. I live in Memphis, TN and I enjoy duck hunting, fishing, golf, and gardening.", image_url: "https://avatars.githubusercontent.com/u/77342332?v=4", host: true, password: "password", zip_code: "38103"})

    user2 = User.create({first_name: "Evan", last_name: "Mallard", email: "evan@gmail.com", phone_number: "5555555555", address: "1154 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Etiam sit amet nisl purus in mollis nunc sed id. Aenean euismod elementum nisi quis.", image_url: "https://www.stevensegallery.com/640/360", host: false, password: "password", password_confirmation: "password", zip_code: "38103"})

    listing = Listing.create({user_id: user.id, title: "Full Season Lease Available in Earle, AR", description: "Tempus imperdiet nulla malesuada pellentesque. Nec tincidunt praesent semper feugiat. Non nisi est sit amet facilisis magna etiam tempor orci. Proin nibh nisl condimentum id venenatis. Tristique senectus et netus et malesuada fames. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla.", address: "201 Twist HWY, Three Forks, AR 72331", latitude: 35.33862, longitude: -90.449976, availability: "Sept 15-30, Nov 21-30, Dec 11-23, 2021, Dec 26, 2021 - Jan 31, 2022", price: "$8000, one field, no splitting the leases between multiple groups"})

    image = Image.create({listing_id: listing.id, url: "https://www.louisianasportsman.com/wp-content/uploads/2014/01/p1391188684-1.jpg"})

    image2 = Image.create({listing_id: listing.id, url: "https://content.osgnetworks.tv/wildfowl/content/photos/mallard-drake-landing-on-water.jpg"})
  end

  describe "GET /images/:id" do
    it 'shows one image based on the image id' do
      get "/images/#{Image.first.id}"

      image = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(image["url"]).to eq("https://www.louisianasportsman.com/wp-content/uploads/2014/01/p1391188684-1.jpg")
    end
  end

  describe "POST /images" do
    it 'creates an image for a particular listing' do
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      post "/images", params: {
        listing_id: Listing.first.id,
        url: "http://www.images.com/image"
      }, headers: {"Authorization" => "Bearer #{jwt}"}

      image = JSON.parse(response.body)

      expect(response).to have_http_status(201)
    end

    it 'returns unauthorized if jwt and listing user id do not match' do
      jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      post "/images", params: {
        listing_id: Listing.first.id,
        url: "http://www.images.com/image"
      }, headers: {"Authorization" => "Bearer #{jwt}"}

      image = JSON.parse(response.body)

      expect(response).to have_http_status(:unauthorized)
    end

    describe "DELETE /images/:id" do
      it 'deletes image based on image id' do
        jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

        delete "/images/#{Image.first.id}", headers: {"Authorization" => "Bearer #{jwt}"}

        expect(response).to have_http_status(200)
      end

      it 'returns :unauthorized if user id and listing id do not match' do
        # calls User.second because listings are created by first user
        jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

        delete "/images/#{Image.first.id}", headers: {"Authorization" => "Bearer #{jwt}"}

        expect(response).to have_http_status(401)
      end
    end
  end
end
