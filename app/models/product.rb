class Product < ApplicationRecord
    has_many :cart_lines
    before_destroy :ensure_no_product_in_cart_line
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :price, :name, :description, presence: true
    validates :name, uniqueness: true

    private
    def ensure_no_product_in_cart_line
        unless cart_lines.empty?
            errors.add(:base, "product is pre-existing in cartline and could not be removed")
            throw :abort
        end
    end
end
