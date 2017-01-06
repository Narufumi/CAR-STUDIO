class Car < ApplicationRecord
  belongs_to :maker
  belongs_to :car_type
  belongs_to :user
  has_many :items
  has_many :specs
  has_many :car_images
  has_many :equipments
  has_many :body_type_cars
  has_many :new_car_specs
  has_many :conditions
  has_many :body_types, through: :body_type_cars
  # mount_uploader :image, ThumbnailUploader
end
