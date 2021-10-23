class BookingsController < ApplicationController
  def show

    @booking = Booking.find(params[:id])
    raise
  end

  def new
    @horse = Horse.find(params[:horse_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    # we need `restaurant_id` to associate booking with corresponding restaurant
    @horse = Horse.find(params[:horse_id])
    @booking.horse = @horse
    @booking.save
    if @booking.save
      redirect_to horse_booking_path(@horse, @booking)
    else
      raise
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date, :horse)
  end
end
