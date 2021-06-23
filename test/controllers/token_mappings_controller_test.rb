require "test_helper"

class TokenMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token_mapping = token_mappings(:one)
  end

  test "should get index" do
    get token_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_token_mapping_url
    assert_response :success
  end

  test "should create token_mapping" do
    assert_difference('TokenMapping.count') do
      post token_mappings_url, params: { token_mapping: { match: @token_mapping.match, replace: @token_mapping.replace, token_type: @token_mapping.token_type, token_variant: @token_mapping.token_variant } }
    end

    assert_redirected_to token_mapping_url(TokenMapping.last)
  end

  test "should show token_mapping" do
    get token_mapping_url(@token_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_token_mapping_url(@token_mapping)
    assert_response :success
  end

  test "should update token_mapping" do
    patch token_mapping_url(@token_mapping), params: { token_mapping: { match: @token_mapping.match, replace: @token_mapping.replace, token_type: @token_mapping.token_type, token_variant: @token_mapping.token_variant } }
    assert_redirected_to token_mapping_url(@token_mapping)
  end

  test "should destroy token_mapping" do
    assert_difference('TokenMapping.count', -1) do
      delete token_mapping_url(@token_mapping)
    end

    assert_redirected_to token_mappings_url
  end
end
