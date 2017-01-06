class Maker < ApplicationRecord
  has_many :cars
  has_many :car_types
  belongs_to :category
end
