class Cart < ApplicationRecord
    attr_accessor :cart_lines
    has_many :cart_lines, dependent: :destroy
    def add_product product
        cart_line = cart_lines.find_by(product_id: product.id)
        unless cart_line.nil?
            cart_line.quantity += 1
        else 
            cart_line=cart_lines.build(product: product)
        end
        cart_line
    end
end 