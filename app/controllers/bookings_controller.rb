class BookingsController < ApplicationController
  
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(params.require(:booking).permit(:price, :start_date, :end_date, :person, :total_days, :room_id))
    @booking.total_days = @booking.room.price * (@booking.end_date - @booking.start_date).to_i * @booking.person.to_i
    if @booking.save
      flash[:notice] = "予約情報は正しいですか？"
      redirect_to @booking
    else
      flash[:alert] = "予約に失敗しました。"
      @room = @booking.room
      render "rooms/show"
    end
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    flash[:notice] = "予約が完了しました。"
    redirect_to :bookings
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = "予約をキャンセルしました。"
    redirect_to :bookings
  end
  
end
