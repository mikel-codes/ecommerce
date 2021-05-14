require "application_system_test_case"

class CollectedItemsTest < ApplicationSystemTestCase
  setup do
    @collected_item = collected_items(:one)
  end

  test "visiting the index" do
    visit collected_items_url
    assert_selector "h1", text: "Collected Items"
  end

  test "creating a Collected item" do
    visit collected_items_url
    click_on "New Collected Item"

    fill_in "Cart", with: @collected_item.cart_id
    fill_in "Product", with: @collected_item.product_id
    click_on "Create Collected item"

    assert_text "Collected item was successfully created"
    click_on "Back"
  end

  test "updating a Collected item" do
    visit collected_items_url
    click_on "Edit", match: :first

    fill_in "Cart", with: @collected_item.cart_id
    fill_in "Product", with: @collected_item.product_id
    click_on "Update Collected item"

    assert_text "Collected item was successfully updated"
    click_on "Back"
  end

  test "destroying a Collected item" do
    visit collected_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collected item was successfully destroyed"
  end
end
