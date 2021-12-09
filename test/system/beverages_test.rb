require "application_system_test_case"

class BeveragesTest < ApplicationSystemTestCase
  setup do
    @beverage = beverages(:one)
  end

  test "visiting the index" do
    visit beverages_url
    assert_selector "h1", text: "Beverages"
  end

  test "creating a Beverage" do
    visit beverages_url
    click_on "New Beverage"

    fill_in "Name", with: @beverage.name
    fill_in "Price", with: @beverage.price
    click_on "Create Beverage"

    assert_text "Beverage was successfully created"
    click_on "Back"
  end

  test "updating a Beverage" do
    visit beverages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @beverage.name
    fill_in "Price", with: @beverage.price
    click_on "Update Beverage"

    assert_text "Beverage was successfully updated"
    click_on "Back"
  end

  test "destroying a Beverage" do
    visit beverages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beverage was successfully destroyed"
  end
end
