class HorsesController < ApplicationController

  def index
    @horses = Horse.all
  end

  def show
    @horse = Horse.find(params[:id])
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.find(horse_params)
    @horse.save
    redirect_to horse_path(@horse.id)
  end


  private

  def horse_params
    params.require(:horse).permit(:horse_name, :speed, :height, :obedience)
  end
end
