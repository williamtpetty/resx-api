require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    # create users for validations
    user = User.create({first_name: "William", last_name: "Petty", email: "pettwil1131@gmail.com", phone_number: "5555555555", address: "1131 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Hey I'm Will. I live in Memphis, TN and I enjoy duck hunting, fishing, golf, and gardening.", image_url: "https://avatars.githubusercontent.com/u/77342332?v=4", host: true, password: "password", zip_code: "38103"})

    user2 = User.create([{first_name: "Evan", last_name: "Mallard", email: "evan@gmail.com", phone_number: "5555555555", address: "1154 Harbor River Cv", city: "Memphis", state: "TN", about_me: "Etiam sit amet nisl purus in mollis nunc sed id. Aenean euismod elementum nisi quis.", image_url: "https://www.stevensegallery.com/640/360", host: false, password: "password", password_confirmation: "password", zip_code: "38103"}])
  end
  describe "GET /users/:id" do
    # no index - starting w/ user show
    it "shows one user based off user_id" do
      # validations: must be logged in user/show, confirmed - works with both users
      jwt = JWT.encode({user_id: User.second.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      get "/users/#{User.first.id}", headers: {"Authorization" => "Bearer #{jwt}"}

      # assign first user to var
      user = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(user["first_name"]).to eq("William")
    end
  end

  describe "POST /users" do
    it 'creates user based on defined parameters' do
      # do not need to be logged in to create a user, obviously
      post "/users", params: {
        first_name: "First",
        last_name: "Last",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: "password",
        phone_number: "5555555555",
        address: "111 Address Cv.",
        city: "Memphis",
        state: "TN",
        zip_code: "38103",
        image_url: "www.com"
      }

      user = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(user["first_name"]).to eq("First")
      expect(user["last_name"]).to eq("Last")
      expect(user["email"]).to eq("test@gmail.com")
    end

    it 'returns :bad_request (400) if password does not match' do
      # passwords below do not match, passes
      post "/users", params: {
        first_name: "First",
        last_name: "Last",
        email: "test@gmail.com",
        password: "password",
        password_confirmation: "wordpass",
        phone_number: "5555555555",
        address: "111 Address Cv.",
        city: "Memphis",
        state: "TN",
        zip_code: "38103",
        image_url: "www.com"
      }
      expect(response).to have_http_status(:bad_request)
    end

    it 'returns :bad_request (400) if email is left out' do
      # email is left out
      post "/users", params: {
        first_name: "First",
        last_name: "Last",
        password: "password",
        password_confirmation: "wordpass",
        phone_number: "5555555555",
        address: "111 Address Cv.",
        city: "Memphis",
        state: "TN",
        zip_code: "38103",
        image_url: "www.com"
      }
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'PATCH /users/:id' do
    it 'returns :ok if current_user is updated with defined parameters' do
      # works w/ both users, but only if you select correct id in patch req.
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      # requires password to be entered
      patch "/users/#{User.first.id}", params: {
        first_name: "Testing",
        last_name: "Lastname",
        password: "password",
      }, headers: {"Authorization" => "Bearer #{jwt}"}

      user = JSON.parse(response.body)
      expect(response).to have_http_status(:created)
      expect(user["first_name"]).to eq("Testing")
      expect(user["last_name"]).to eq("Lastname")
    end

    it 'returns :unauthorized if no jwt is passed' do
      # works w/ both users, but only if you select correct id in patch req.
      jwt = JWT.encode({user_id: User.first.id, exp: 24.hours.from_now.to_i}, Rails.application.credentials.fetch(:secret_key_base), "HS256")

      #
      patch "/users/#{User.first.id}", params: {
        first_name: "Second",
        last_name: "Lastname",
        password: "password",
      }

      expect(response).to have_http_status(401)
    end
  end
end
