class ListingsController < ApplicationController
  before_action :is_user?, only: [:edit, :update, :delete]

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new listing_params
    @listing.user = current_user
    @listing.save
    redirect_to @listing
  end

  def edit
    @listing = Listing.find params[:id]
  end

  def update
    @listing = Listing.find params[:id]
    @listing.update listing_params
    redirect_to @listing
  end

  def destroy
    @listing = Listing.find params[:id]
    @listing.destroy
    redirect_to mylistings_path
  end

  def show
    @listing = Listing.find params[:id]
  end

  def search
    location = params[:location]
    if location.present? && !location.index(",")
      params[:location] = "#{location}, BC"
    end
    @listings = Listing.search(params)
  end

  def mylistings
    @listings = Listing.where(user: current_user)
  end

  private

    def listing_params
      params.require(:listing).permit(:title, :description, :city, :state, :zipcode, :category_id, :subcategory_id)
    end

    def is_user?
      @listing = Listing.find params[:id]
      unless current_user == @listing.user
        redirect_to root_path, alert: 'Sorry, you are not the user of this listing.'
      end
    end

end