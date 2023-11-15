class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params) # create a new instance  with the comment
    @restaurant = Restaurant.find(params[:restaurant_id]) # retriveving from the database the exact restaurant we talking about
    @review.restaurant_id = @restaurant.id # because review belongs to restaurant
    if @review.save # save it forever in the database
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def review_params
    params.require(:review).permit(:comment)  # returns filtered params
  end
end
