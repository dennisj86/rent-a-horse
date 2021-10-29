class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @horses = Horse.all
   # @horses = Horse.filter(params.slice(:speed, :heigth, :obedience, :location))
    @user = current_user

    @markers = @horses.geocoded.map do |horse|
      {
        lat: horse.latitude,
        lng: horse.longitude,
        info_window: render_to_string(partial: 'info_window', locals: { horse: horse })
      }
    end
  end

  def show
    @horse = Horse.find(params[:id])
    @user = current_user
  end

  def new
    @horse = Horse.new
    @user = current_user
  end

  def create
    @user = current_user
    @horse = Horse.new(horse_params)
    @horse.user = current_user
    @horse.save

    if @horse.save
      redirect_to horse_path(@horse.id)
    else
      render :new
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:horse_name, :speed, :height, :obedience, :photo, :address)
  end
end
