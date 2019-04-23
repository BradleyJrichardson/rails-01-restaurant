# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)

    flash[:success] = 'review created' if @review.save

    redirect_to restaurant_path(@restaurant.id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.permit(:title, :content, :rating)
  end
end
