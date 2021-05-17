require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "should get new" do
    get login_url
    assert_response :success
  end

  test "should get create" do
    post login_url, params: {username: @user.username, password: "arch_city"}
    assert_response :redirect
    assert_redirected_to admin_url
  end

  test "should get destroy" do
    delete logout_path
    assert_response :redirect
    assert_redirected_to login_url
    follow_redirect!
    assert_equal flash[:notice], "you logged out"
  end

end
