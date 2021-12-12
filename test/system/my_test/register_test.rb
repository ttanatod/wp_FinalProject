require "application_system_test_case"

class Test < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "register success" do
    visit register_path

    fill_in "Firstname", with: "MyString3"
    fill_in "Lastname", with: "MyString3"
    fill_in "Email", with: "MyString3"
    fill_in "Username", with: "MyString3"
    fill_in "Password", with: "MyString3"
    fill_in "Password confirmation", with: "MyString3"

    click_on "OK"

    assert_text "User was successfully created."
  end
end
