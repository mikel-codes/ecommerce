class Product < ApplicationRecord
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :price, :name, :description, presence: true
    validates :name, uniqueness: true
end
