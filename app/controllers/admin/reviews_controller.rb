class Admin::ReviewsController < ApplicationController
  before_action :set_restaurant
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to admin_restaurant_path, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
      redirect_to admin_restaurant_path, notice: 'Review was successfully destroyed.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
