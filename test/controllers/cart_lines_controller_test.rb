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

  
    follow_redirect!
    assert_select "h1", "Showing Cart:"
  end


  test "should get edit" do
    get edit_cart_line_url(@cart_line)
    assert_response :success
  end



  test "should destroy cart_line" do
    assert_difference('CartLine.count', -1) do
      delete cart_line_url(@cart_line)
    end
    assert_not_equal('CarLine.count', 0) do
      follow_redirect! 
      assert_select 'h1', "Shopping Cart:"

    end
  end
end
