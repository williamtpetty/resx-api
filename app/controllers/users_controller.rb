class UsersController < ApplicationController

  # def index # DISCLAIMER: I'm not keeping this I just need it to see my users
  #   user = User.all
  #   render json: user
  # end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip_code: params[:zip_code],
      about_me: params[:about_me],
      image_url: params[:image_url],
      host: params[:host],
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
    user.update(
        first_name: params[:first_name] || user.first_name,
        last_name: params[:last_name] || user.last_name,
        email: params[:email] || user.email,
        password: params[:password] || user.password,
        password_confirmation: params[:password_confirmation] || user.password_confirmation,
        phone_number: params[:phone_number] || user.phone_number,
        address: params[:address] || user.address,
        city: params[:city] || user.city,
        state: params[:state] || user.state,
        zip_code: params[:zip_code] || user.zip_code,
        about_me: params[:about_me] || user.about_me,
        image_url: params[:image_url] || user.image_url,
        host: params[:host] || user.host,
      )
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    render json: {message: "User has been removed from database."}
  end

end
