class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to user_path(review.receiver_id),notice: 'success'
    else
      redirect_to user_path(review.receiver_id),notice: 'failed'
    end
  end

  private
   def review_params
     params.require(:review).permit(:user_id,:receiver_id,:star,:comment)
   end

end
