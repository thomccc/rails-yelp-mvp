class ReviewsController < ApplicationController
   def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if  @review.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "Successfully created"
    else
      render :new
      flash[:alert] = "Check your must-complete blocks"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
