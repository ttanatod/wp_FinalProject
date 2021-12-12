require "application_system_test_case"

class Test < ApplicationSystemTestCase
  test "not login" do
    visit main_path
    click_on "Beverage"
    click_on "next"

    assert_text "Please login"
  end

  test "" do
    login
    click_on "Beverage"
    click_on "next"
    
    assert_text "please select seat or beverage"
  end

  def login
    visit login_path

    fill_in "Username", with: "MyString"
    fill_in "Password", with: "MyString"

    click_on "Log in"
  end
end
