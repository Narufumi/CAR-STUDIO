class BodyType < ApplicationRecord
  has_many :body_type_cars
  has_many :cars, through: :body_type_cars
  belongs_to :category
end
