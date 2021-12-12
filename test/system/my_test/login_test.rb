require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "log in success" do
    visit login_path

    fill_in "Username", with: @user.username
    fill_in "Password", with: "MyString"

    click_on "Log in"

    assert_text "Log in successfully"
  end

  test "log in fail" do 

    visit login_path

    fill_in "Username", with: @user.username
    fill_in "Password", with: "FalsePassword"

    click_on "Log in"

    assert_text "Wrong email or password!"
  end

end
