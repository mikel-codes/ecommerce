class AddQuantityToCartLines < ActiveRecord::Migration[6.0]
  def up
    add_column :cart_lines, :quantity, :integer, default: 1
  end
  def down
    remove_column :cart_lines, :quantity, :integer
  end
end
