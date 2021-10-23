class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @horse = Horse.find(params[:horse_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @horse = Horse.find(params[:horse_id])
    user = current_user
    @booking.horse = @horse
    @booking.user = user
    @booking.save
    if @booking.save
      redirect_to horse_booking_path(@horse, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date)
  end
end
