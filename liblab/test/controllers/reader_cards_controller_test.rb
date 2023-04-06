require "test_helper"

class ReaderCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reader_card = reader_cards(:one)
  end

  test "should get index" do
    get reader_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_reader_card_url
    assert_response :success
  end

  test "should create reader_card" do
    assert_difference("ReaderCard.count") do
      post reader_cards_url, params: { reader_card: { book: @reader_card.book, user: @reader_card.user } }
    end

    assert_redirected_to reader_card_url(ReaderCard.last)
  end

  test "should show reader_card" do
    get reader_card_url(@reader_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_reader_card_url(@reader_card)
    assert_response :success
  end

  test "should update reader_card" do
    patch reader_card_url(@reader_card), params: { reader_card: { book: @reader_card.book, user: @reader_card.user } }
    assert_redirected_to reader_card_url(@reader_card)
  end

  test "should destroy reader_card" do
    assert_difference("ReaderCard.count", -1) do
      delete reader_card_url(@reader_card)
    end

    assert_redirected_to reader_cards_url
  end
end
