require "application_system_test_case"

class Test < ApplicationSystemTestCase
  test "buy ticket" do
    login

    click_on "buy ticket"
    click_on "09:30"
    click_on "1", match: :first
    click_on "next"
    sleep 1.5
    click_on "next"

    assert_text "VENOM"
    assert_text "A1"
    assert_text "TOTAL PRICE: 240"

    click_on "confirm"
    assert_text "buy successfully"

    click_on "My Order"
    sleep 1.5
    assert_text "VENOM-A1"
    assert_text "240"
  end

  test "buy beverage" do
    login
    click_on "Beverage"
    fill_in "Coca-Cola", with: "2"
    click_on "next"

    assert_text "Coca-Cola"
    assert_text "quantity: 2"
    assert_text "TOTAL PRICE: 60"
    click_on "confirm"
    assert_text "buy successfully"

    click_on "My Order"
    sleep 1.5
    assert_text "Coca-Cola"
    assert_text "60"
  end

  test "buy ticket and beverage" do
    login

    click_on "buy ticket"
    click_on "09:30"
    click_on "1", match: :first
    click_on "next"
    sleep 1.5
    click_on "Beverage"
    fill_in "Coca-Cola", with: "2"
    click_on "next"
    click_on "next"

    assert_text "TOTAL PRICE: 300"

    click_on "confirm"
    assert_text "buy successfully"

    click_on "My Order"
    sleep 1.5
    assert_text "VENOM-A1"
    assert_text "240"
    assert_text "Coca-Cola"
    assert_text "60"
  end

  def login
    visit login_path

    fill_in "Username", with: "MyString"
    fill_in "Password", with: "MyString"

    click_on "Log in"
  end
end
