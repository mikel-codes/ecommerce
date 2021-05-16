class Cart < ApplicationRecord
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

    def total_sum
        cart_lines.to_a.sum { |line| line.total_price}
    end
end 