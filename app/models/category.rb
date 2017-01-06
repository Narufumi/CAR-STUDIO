class Category < ApplicationRecord
  has_many :makers
  has_many :body_types
end
