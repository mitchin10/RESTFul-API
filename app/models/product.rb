class Product < ApplicationRecord
  validates_presence_of :product_name, :description
end
