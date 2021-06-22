class ImagesController < ApplicationController

  skip_before_action :authenticate_user, only: [:show]
  # before_action :authenticate_host 
  # Do we need this, really? not going to be able to get to images unless we're
  # already creating or updating a listing, so don't think we need it

  # def index #DISCLAIMER: Will remove this, just need it for the time being
  #   image = Image.all
  #   render json: image.as_json
  # end

  def create
    image = Image.new(
      listing_id: params[:listing_id],
      url: params[:url],
    )
    if image.save
      render json: image, status: :created
    else
      render json: { errors: image.errors.full_messages }, status: :bad_request
    end
  end

  def show
    image = Image.find(params[:id])
    render json: image
  end

  def destroy
    image = Image.find(params[:id])
    image.delete
    render json: {message: "This image has been deleted from the listing"}
  end

end
