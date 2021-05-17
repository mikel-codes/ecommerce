class Order < ApplicationRecord
    has_many :cart_lines, dependent: :destroy
    enum pay_type: {
        "Check" => 0,
        "Credit card" => 1,
        "Purchase order" => 2
        }
    validates :name, :email, :address, presence: true
    validates :pay_type, inclusion: pay_types.keys

    def collect_all_items_from_cart(cart)
        cart.cart_lines.each do |item|
          cart_lines << item
        end
    end
end
