class PersonalUrlsController < ApplicationController

  def create
    personal_url = PersonalUrl.new(
      user_id: current_user.id,
      personal_url: params[:personal_url]
    )
    if personal_url.save
      render json: personal_url.as_json, status: :created
    else
      render json: { errors: personal_url.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    personal_url = PersonalUrl.find(params[:id])
    personal_url.destroy
    render json: {message: "This url has been removed from listing"}, status: :ok
  end

end
