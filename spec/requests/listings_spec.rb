require 'rails_helper'

RSpec.describe "Listings", type: :request do
  before do
    # create users for validations
    user = User.create({first_name: "William", last_name: "Petty", email: "pettwil1131@gmail.com", phone_number: "5555555555", address: "1131 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Hey I'm Will. I live in Memphis, TN and I enjoy duck hunting, fishing, golf, and gardening.", image_url: "https://avatars.githubusercontent.com/u/77342332?v=4", host: true, password: "password", zip_code: "38103"})

    user2 = User.create([{first_name: "Evan", last_name: "Mallard", email: "evan@gmail.com", phone_number: "5555555555", address: "1154 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Etiam sit amet nisl purus in mollis nunc sed id. Aenean euismod elementum nisi quis.", image_url: "https://www.stevensegallery.com/640/360", host: false, password: "password", password_confirmation: "password", zip_code: "38103"}])

    # have to be created with user, as user is host
    Listing.create!([
      {user_id: user.id, title: "Full Season Lease Available in Earle, AR", description: "Tempus imperdiet nulla malesuada pellentesque. Nec tincidunt praesent semper feugiat. Non nisi est sit amet facilisis magna etiam tempor orci. Proin nibh nisl condimentum id venenatis. Tristique senectus et netus et malesuada fames. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla.", address: "201 Twist HWY, Three Forks, AR 72331", latitude: 35.33862, longitude: -90.449976, availability: "Sept 15-30, Nov 21-30, Dec 11-23, 2021, Dec 26, 2021 - Jan 31, 2022", price: "$8000, one field, no splitting the leases between multiple groups"},
      {user_id: user.id, title: "Guided Weekend Hunts Available in Parkin, AR", description: "Tempus imperdiet nulla malesuada pellentesque. Nec tincidunt praesent semper feugiat. Non nisi est sit amet facilisis magna etiam tempor orci. Proin nibh nisl condimentum id venenatis. Tristique senectus et netus et malesuada fames. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla.", address: "300 County Road 424, Togo, AR", latitude: 35.3404494, longitude: -90.5700117, availability: "Saturday/Sunday during the entire legal hunting season & juvenile hunt. No early teal.", price: "$250/day/hunter. $425 for both Saturday and Sunday together"},
      {user_id: user.id, title: "Early Season Week With Guide Available in Cherry Valley, AR", description: "Tempus imperdiet nulla malesuada pellentesque. Nec tincidunt praesent semper feugiat. Non nisi est sit amet facilisis magna etiam tempor orci. Proin nibh nisl condimentum id venenatis. Tristique senectus et netus et malesuada fames. Cursus eget nunc scelerisque viverra mauris in aliquam sem fringilla.", address: "3509 AR-1, Cherry Valley, AR 72324", latitude: 35.39853, longitude: -90.7644254, availability: "December 11 - 18, 2021", price: "With guide (available on weekends): $1800/week, without guide: $1200"}
    ])
  end

  describe "GET /listings" do
    it "returns an array of listings objects" do
      # send get listings index request
      get "/listings"
      # sets variable listings to the body key of the response array
      listings = JSON.parse(response.body)
      # if successful response, returns a 200 http status
      expect(response).to have_http_status(200)
      expect(listings.length).to eq(3)
    end
  end

  describe "GET /listings/:id" do
    it 'returns one show page based on listing_id' do

      # this is confirmed to work with first and second user
      jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # pass the jwt after the get request, otherwise you will get 401 for show
      get "/listings/#{Listing.first.id}", headers: {"Authorization" => "Bearer #{jwt}"}

      listing = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(listing["title"]).to eq("Full Season Lease Available in Earle, AR")
      expect(listing["address"]).to eq("201 Twist HWY, Three Forks, AR 72331")
    end
  end

  describe 'POST /listings' do
    it 'creates a posting based on defined parameters' do
      # JWT must come from first user, the host
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # pass the parameters of the listing, and jwt in the header
      post "/listings", params: {
        user_id: User.first.id, 
        title: "This is a test title",
        description: "Here is a test description",
        address: "This is a test address",
        availability: "This will be available in a couple weeks",
        price: "100 bucks",
      }, headers: {"Authorization" => "Bearer #{jwt}"}

      listing = JSON.parse(response.body)

      expect(response).to have_http_status(201)
      expect(listing["title"]).to eq("This is a test title")
      expect(listing["address"]).to eq("This is a test address")

    end
    
    it 'returns unauthorized (401) if unauthorized user' do
      # passes JWT from the second user, non host
      jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      post "/listings", params: {
        user_id: User.first.id, 
        title: "This is a test title",
        description: "Here is a test description",
        address: "This is a test address",
        availability: "This will be available in a couple weeks",
        price: "100 bucks",
      }, headers: {"Authorization" => "Bearer #{jwt}"}
      
      listing = JSON.parse(response.body)

      expect(response).to have_http_status(401)
    end

    it 'returns unprocessable entity (422) if unauthorized user' do
      # passes JWT from first user
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # missing title: and description: which must be validated
      post "/listings", params: {
        user_id: User.first.id, 
        address: "This is a test address",
        availability: "This will be available in a couple weeks",
        price: "100 bucks",
      }, headers: {"Authorization" => "Bearer #{jwt}"}
      
      listing = JSON.parse(response.body)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /listings/:id" do
    it 'updates a listing based on defined parameters' do
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # remainder will populate with current information
      patch "/listings/#{Listing.first.id}", params: {
        address: "This is a test address",
        availability: "This will be available in a couple weeks",
        price: "100 bucks",
      }, headers: {"Authorization" => "Bearer #{jwt}"}
      
      listing = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(listing["address"]).to eq("This is a test address")
      expect(listing["price"]).to eq("100 bucks")
    end

    it 'returns 401 unauthorized if user is not host' do
      # second user not host, should return unauthorized
      jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # user_id not needed, but tested to make sure it worked both ways
      patch "/listings/#{Listing.first.id}", params: {
        address: "This is a test address",
        availability: "This will be available in a couple weeks",
        price: "100 bucks",
      }, headers: {"Authorization" => "Bearer #{jwt}"}
      
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "DELETE /listings/:id" do
    it 'destroys listing based on :id' do
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      delete "/listings/#{Listing.first.id}", headers: {"Authorization" => "Bearer #{jwt}"}

      expect(response).to have_http_status(:ok)
    end
  end
end
