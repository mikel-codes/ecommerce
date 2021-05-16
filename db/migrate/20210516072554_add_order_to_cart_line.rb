class AddOrderToCartLine < ActiveRecord::Migration[6.0]
  def change
    add_reference :cart_lines, :order, null: true, foreign_key: true
  end
end
