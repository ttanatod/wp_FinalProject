require "application_system_test_case"

class Test < ApplicationSystemTestCase
  test "show timetable" do
    visit main_path

    click_on "buy ticket"
    assert_text "VENOM"
    assert_text "Cinema: MyString"
  end


end


