require "application_system_test_case"

class TokenMappingsTest < ApplicationSystemTestCase
  setup do
    @token_mapping = token_mappings(:one)
  end

  test "visiting the index" do
    visit token_mappings_url
    assert_selector "h1", text: "Token Mappings"
  end

  test "creating a Token mapping" do
    visit token_mappings_url
    click_on "New Token Mapping"

    fill_in "Match", with: @token_mapping.match
    fill_in "Replace", with: @token_mapping.replace
    fill_in "Token type", with: @token_mapping.token_type
    fill_in "Token variant", with: @token_mapping.token_variant
    click_on "Create Token mapping"

    assert_text "Token mapping was successfully created"
    click_on "Back"
  end

  test "updating a Token mapping" do
    visit token_mappings_url
    click_on "Edit", match: :first

    fill_in "Match", with: @token_mapping.match
    fill_in "Replace", with: @token_mapping.replace
    fill_in "Token type", with: @token_mapping.token_type
    fill_in "Token variant", with: @token_mapping.token_variant
    click_on "Update Token mapping"

    assert_text "Token mapping was successfully updated"
    click_on "Back"
  end

  test "destroying a Token mapping" do
    visit token_mappings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Token mapping was successfully destroyed"
  end
end
