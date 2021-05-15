require 'test_helper'

class CatalogControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_products_url
    assert_response :success
  end

end
