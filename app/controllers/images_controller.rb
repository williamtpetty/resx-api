class ImagesController < ApplicationController

  skip_before_action :authenticate_user, only: [:index, :show, :create]

  # before_action :authenticate_host, only: [:index]
  # Do we need this, really? not going to be able to get to images unless we're
  # already creating or updating a listing, so don't think we need it

  # DISCLAIMER: Will remove this, just need it for the time being
  # Make sure to add :index to the skip_before above

  def index 
    image = Image.all
    render json: image.as_json
  end

  def create
    image = Image.new(
      listing_id: params[:listing_id],
      url: params[:url],
    )
    if current_user.id == image.listing.user_id
      if image.save
        render json: image, status: :created
      else
        render json: { errors: image.errors.full_messages }, status: :bad_request
      end
    else
      render json: {message: "You are unauthorized to add image to this listing"}, status: 401
    end
  end

  def show
    image = Image.find(params[:id])
    render json: image
  end

  def destroy
    image = Image.find(params[:id])
    if current_user.id == image.listing.user_id
      image.destroy
      render json: {message: "This image has been removed from listing"}, status: :ok
    else
      render json: {message: "You are unauthorized to remove this image"}, status: 401
    end
  end

end
