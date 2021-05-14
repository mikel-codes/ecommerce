require 'test_helper'

class CollectedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collected_item = collected_items(:one)
  end

  test "should get index" do
    get collected_items_url
    assert_response :success
  end

  test "should get new" do
    get new_collected_item_url
    assert_response :success
  end

  test "should create collected_item" do
    assert_difference('CollectedItem.count') do
      post collected_items_url, params: { collected_item: { cart_id: @collected_item.cart_id, product_id: @collected_item.product_id } }
    end

    assert_redirected_to collected_item_url(CollectedItem.last)
  end

  test "should show collected_item" do
    get collected_item_url(@collected_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_collected_item_url(@collected_item)
    assert_response :success
  end

  test "should update collected_item" do
    patch collected_item_url(@collected_item), params: { collected_item: { cart_id: @collected_item.cart_id, product_id: @collected_item.product_id } }
    assert_redirected_to collected_item_url(@collected_item)
  end

  test "should destroy collected_item" do
    assert_difference('CollectedItem.count', -1) do
      delete collected_item_url(@collected_item)
    end

    assert_redirected_to collected_items_url
  end
end
