class ListingsController < ApplicationController

  def index
    listing = Listing.all
    render json: listing  
  end

  def create
    listing = Listing.new(
      user_id: current_user.id,
      title: params[:title],
      description: params[:description],
      address: params[:address],
      availability: params[:availability],
      price: params[:price],
    )
    if listing.save
      render json: listing, status: :created
    else
      render json: { errors: listing.errors.full_messages }, status: :bad_request
    end
  end

  def show
    listing = Listing.find(params[:id])
    render json: listing
  end

  def update
    listing = Listing.find(params[:id])
    listing = Listing.update(
      user_id: current_user.id,
      title: params[:title] || listing.title,
      description: params[:description] || listing.description,
      address: params[:address] || listing.address,
      availability: params[:availability] || listing.availability,
      price: params[:price] || listing.price,
    )
    if listing.save
      render json: listing, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    listing.delete
    render json: {message: "Listing has been deleted."}
  end

end
