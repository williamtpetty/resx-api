class ListingsController < ApplicationController

  skip_before_action :authenticate_user, only: [:index]
  before_action :authenticate_host, except: [:index, :show]

  def index
    # listing = Listing.all # we need this back, will order in Vue App
    listing = Listing.all.order(:id) #remove once starting on front end
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
    if params[:address]
      coordinates = Geocoder.search(params[:address]).first.coordinates
      listing.update(
        latitude: coordinates[0],
        longitude: coordinates[1],
      )
    end
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
    if current_user.id == listing.user_id
      listing.update(
        title: params[:title] || listing.title,
        description: params[:description] || listing.description,
        address: params[:address] || listing.address,
        availability: params[:availability] || listing.availability,
        price: params[:price] || listing.price,
      )

      if params[:address]
        coordinates = Geocoder.search(listing.address).first.coordinates
        listing.update(
          latitude: coordinates[0],
          longitude: coordinates[1],
        )
      end

      if listing.save
        render json: listing, status: :created
      else
        render json: { errors: listing.errors.full_messages }, status: :bad_request
      end

    else
      render json: { message: "You are unauthorized to update this listing."}, status: :bad_request
    end
  end

  def destroy
    listing = Listing.find(params[:id])
    if current_user.id == listing.user_id
      listing.delete
      render json: {message: "Listing has been deleted."}
    else
      render json: { message: "You are unauthorized to update this listing"}, status: :bad_request
    end
  end

  

end
