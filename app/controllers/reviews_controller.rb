class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation_id = @reservation.id
  end

  def create
    @review = Review.new(review_params)
    @reservation = Reservation.find(params[:reservation_id])
    @review.reservation_id = @reservation.id
    if @review.save!
      redirect_to reservation_path(@reservation)
    else
      render :new, alert: "Votre commentaire a bien été pris en compte"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :score, :reservation_id)
  end
end
