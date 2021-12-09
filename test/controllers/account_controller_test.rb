require "test_helper"

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get account_login_url
    assert_response :success
  end

  test "should get check_login" do
    get account_check_login_url
    assert_response :success
  end
end
