require "application_system_test_case"

class KeyWordsTest < ApplicationSystemTestCase
  setup do
    @key_word = key_words(:one)
  end

  test "visiting the index" do
    visit key_words_url
    assert_selector "h1", text: "Key Words"
  end

  test "creating a Key word" do
    visit key_words_url
    click_on "New Key Word"

    fill_in "Name", with: @key_word.name
    click_on "Create Key word"

    assert_text "Key word was successfully created"
    click_on "Back"
  end

  test "updating a Key word" do
    visit key_words_url
    click_on "Edit", match: :first

    fill_in "Name", with: @key_word.name
    click_on "Update Key word"

    assert_text "Key word was successfully updated"
    click_on "Back"
  end

  test "destroying a Key word" do
    visit key_words_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Key word was successfully destroyed"
  end
end
