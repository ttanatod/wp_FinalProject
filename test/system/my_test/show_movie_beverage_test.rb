require "application_system_test_case"

class Test < ApplicationSystemTestCase
  test "showing movie" do
    visit main_path

    assert_text "VENOM"
    assert_text "buy ticket"
  end

  test "coming soon movie" do
    visit main_path

    assert_text "4KINGS"
    assert_text "coming soon"
  end

  test "show beverage" do
    visit buybeverage_path

    assert_text "Coca-Cola"
    assert_text "Cheese-Popcorn"
    assert_text "30"
    assert_text "100"
  end
end
