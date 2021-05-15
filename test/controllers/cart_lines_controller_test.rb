require 'test_helper'

class CartLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_line = cart_lines(:one)
  end

  test "should get index" do
    get cart_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_line_url
    assert_response :success
  end

  test "should create cart_line" do
    assert_difference('CartLine.count') do
      post cart_lines_url, params: { product_id: @cart_line.product_id } 
    end

    assert_redirected_to cart_lines_url
    follow_redirect!
    #assert_select 
  end

  test "should show cart_line" do
    get cart_line_url(@cart_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_line_url(@cart_line)
    assert_response :success
  end

  test "should update cart_line" do
    patch cart_line_url(@cart_line), params: { cart_line: { cart_id: @cart_line.cart_id, product_id: @cart_line.product_id } }
    assert_redirected_to cart_line_url(@cart_line)
  end

  test "should destroy cart_line" do
    assert_difference('CartLine.count', -1) do
      delete cart_line_url(@cart_line)
    end

    assert_redirected_to cart_lines_url
  end
end
