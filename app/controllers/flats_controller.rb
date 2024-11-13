class FlatsController < ApplicationController

  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @flats = Flat.where("LOWER(name) LIKE ? OR LOWER(description) LIKE ?", query, query)
    else
      @flats = Flat.all
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)

    redirect_to flat_path(@flat)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
