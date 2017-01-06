class CarType < ApplicationRecord
  belongs_to :maker
  has_many :cars
end
