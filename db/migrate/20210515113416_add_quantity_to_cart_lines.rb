class AddQuantityToCartLines < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_lines, :quantity, :integer
  end
end
