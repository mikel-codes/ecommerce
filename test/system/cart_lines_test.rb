require "application_system_test_case"

class CartLinesTest < ApplicationSystemTestCase
  setup do
    @cart_line = cart_lines(:one)
  end

  test "visiting the index" do
    visit cart_lines_url
    assert_selector "h1", text: "Cart Lines"
  end

  test "creating a Cart line" do
    visit cart_lines_url
    click_on "New Cart Line"

    fill_in "Cart", with: @cart_line.cart_id
    fill_in "Product", with: @cart_line.product_id
    click_on "Create Cart line"

    assert_text "Cart line was successfully created"
    click_on "Back"
  end

  test "updating a Cart line" do
    visit cart_lines_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @cart_line.cart_id
    fill_in "Product", with: @cart_line.product_id
    click_on "Update Cart line"

    assert_text "Cart line was successfully updated"
    click_on "Back"
  end

  test "destroying a Cart line" do
    visit cart_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cart line was successfully destroyed"
  end
end
