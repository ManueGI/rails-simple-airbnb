class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show

  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(params_flat)

    if @flat.save
      redirect_to flats_path
    else
      render :edit
    end
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.save!

    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def params_flat
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
