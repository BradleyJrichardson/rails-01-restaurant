# frozen_string_literal: true

class Review < ApplicationRecord
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :food_type, presence: true
end
