# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)

    if @review.save
      flash[:success] = 'review created'
    else
      flash[:error] = 'Log in to leave a review'
    end

    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def review_params
    params.permit(:title, :content, :rating)
  end
end
