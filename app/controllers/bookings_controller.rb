class BookingsController < ApplicationController
  before_action :user, only: %i[index show new create destroy]
  before_action :horse, only: %i[new create]

  def index
    @bookings = Booking.where(user: @user.id)
  end

  def show
    @booking = Booking.find(params[:id])
    @marker = [{
      lat: @booking.horse.latitude,
      lng: @booking.horse.longitude
    }]
  end

  def new
    @horse = Horse.find(params[:horse_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @horse = Horse.find(params[:horse_id])
    @booking.horse = @horse
    @booking.user = @user
    @booking.save
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@user.id)
  end

  private

  def horse
    @horse = Horse.find(params[:horse_id])
  end

  def user
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:from_date, :to_date)
  end
end
