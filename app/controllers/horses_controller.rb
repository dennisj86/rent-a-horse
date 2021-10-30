class HorsesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :user, only: %i[index show new create]
  before_action :find_horse, only: [:show]

  def index
    @horses = Horse.all
    if params[:obedience].present? && params[:obedience] != ""

      sql_query = "obedience ILIKE :obedience"
      # OR heigth ILIKE :query OR speed ILIKE :query"
      @horses = Horse.where(sql_query, obedience: "%#{params[:obedience]}%")
    end

    #if params[:speed].present? && params[:speed] != ""
      #current_speed = params[:speed].to_i
      #sql_query = "speed ILIKE :speed"
      # OR heigth ILIKE :query OR speed ILIKE :query"
      #@horses = Horse.where(sql_query, speed: "%#{current_speed}%")
    #end


    @user = current_user
    if @horses.length > 0
      @markers = @horses.geocoded.map do |horse|
        {
          lat: horse.latitude,
          lng: horse.longitude,
          info_window: render_to_string(partial: 'info_window', locals: { horse: horse })
        }
      end
    end
  end

  def show
    @horse = Horse.find(params[:id])
    @marker = [{
        lat: @horse.latitude,
        lng: @horse.longitude,
        info_window: render_to_string(partial: 'info_window', locals: { horse: @horse })
      }]
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
