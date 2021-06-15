class UsersController < ApplicationController

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
      about_me: params[:about_me],
      image_url: params[:image_url],
      host: params[:host],
    )
    if user.save
      render json: user.as_json, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
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
        about_me: params[:about_me] || user.about_me,
        image_url: params[:image_url] || user.image_url,
        host: params[:host] || user.host,
      )
    if user.save
      render json: user.as_json, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

end
