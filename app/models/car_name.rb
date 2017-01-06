class CarName < ApplicationRecord
  has_many :cars
  belongs_to :maker
end
