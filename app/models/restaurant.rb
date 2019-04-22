# frozen_string_literal: true

class Restaurant < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :food_type, presence: true

  has_many :reviews, dependent: :destroy

  def average_rating
    unless reviews.empty?
      sum = 0
      reviews.each do |review|
        sum += review.rating
      end
      sum / reviews.count
    end
  end
end
