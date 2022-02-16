class FlatsController < ApplicationController

  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @flats = Flat.where(id: params[:search])
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
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def edit
    @flat = set_flat
  end

  def update
    @flat = set_flat
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = set_flat
    @flat.destroy
    redirect_to flats_path
  end
  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :price_per_night, :number_of_guests, :description)
  end
end
