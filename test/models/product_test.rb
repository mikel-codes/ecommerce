require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @prod_params = {
      name: 'Bolt',
      description: 'Fixed with lightning speed',
      price: 19.95
      }
  end
  test "invalid product" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:price].any?
    assert product.errors[:description].any?
  end
  test "valid product"  do
    product = Product.new @prod_params
    assert product.valid?
    assert_not product.errors[:img].any? 

  end
end
