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
    @reservation.ninja.rating = ((@reservation.ninja.rating + @review.score) / 2).round.to_i
    if @review.save!
      redirect_to reservations_path(@reservation)
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
