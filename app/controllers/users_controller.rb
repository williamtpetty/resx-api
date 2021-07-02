class UsersController < ApplicationController

  skip_before_action :authenticate_user, only: [:create]

  def index # DISCLAIMER: I'm not keeping this I just need it to see my users
    user = User.all
    render json: user
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      # phone_number: params[:phone_number],
      # address: params[:address],
      # city: params[:city],
      # state: params[:state],
      # zip_code: params[:zip_code],
      # about_me: params[:about_me],
      # image_url: params[:image_url],
      # host: params[:host],
    )
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    if current_user.id == user.id
      user.first_name = params[:first_name] || user.first_name
      user.last_name = params[:last_name] || user.last_name
      user.email = params[:email] || user.email
      if params[:password]
        user.password = params[:password] || user.password
        user.password_confirmation = params[:password_confirmation] || user.password_confirmation
      end
      user.phone_number = params[:phone_number] || user.phone_number
      user.address = params[:address] || user.address
      user.city = params[:city] || user.city
      user.state = params[:state] || user.state
      user.zip_code = params[:zip_code] || user.zip_code
      user.about_me = params[:about_me] || user.about_me
      user.image_url = params[:image_url] || user.image_url
      user.host = params[:host] || user.host
      if user.save
        render json: user, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :bad_request
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    if current_user.id == user.id
      user.delete
      render json: {message: "User has been removed from database."}
    end
  end

end
