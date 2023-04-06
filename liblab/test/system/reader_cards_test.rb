require "application_system_test_case"

class ReaderCardsTest < ApplicationSystemTestCase
  setup do
    @reader_card = reader_cards(:one)
  end

  test "visiting the index" do
    visit reader_cards_url
    assert_selector "h1", text: "Reader cards"
  end

  test "should create reader card" do
    visit reader_cards_url
    click_on "New reader card"

    fill_in "Book", with: @reader_card.book
    fill_in "User", with: @reader_card.user
    click_on "Create Reader card"

    assert_text "Reader card was successfully created"
    click_on "Back"
  end

  test "should update Reader card" do
    visit reader_card_url(@reader_card)
    click_on "Edit this reader card", match: :first

    fill_in "Book", with: @reader_card.book
    fill_in "User", with: @reader_card.user
    click_on "Update Reader card"

    assert_text "Reader card was successfully updated"
    click_on "Back"
  end

  test "should destroy Reader card" do
    visit reader_card_url(@reader_card)
    click_on "Destroy this reader card", match: :first

    assert_text "Reader card was successfully destroyed"
  end
end
