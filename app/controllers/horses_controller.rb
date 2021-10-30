class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :user, only: %i[index show new create]

  def index
    @horses = Horse.all

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
  end

  def new
    @horse = Horse.new
  end

  def create
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

  def user
    @user = current_user
  end

  def horse_params
    params.require(:horse).permit(:horse_name, :speed, :height, :obedience, :photo, :address)
  end
end
