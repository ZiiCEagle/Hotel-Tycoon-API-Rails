require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tim = users(:tim)
  end

  test "should get create" do
    post password_resets_url, {email: @tim.email}

    body = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Mime[:json], response.content_type
    assert_equal "Email envoyé", body[:notice]
  end

  test "should get edit" do
    get edit_password_reset_url(@tim.reset_password_token)
    assert_response :success
  end

  test "should get update" do
    patch password_reset_url(@tim.reset_password_token), {user: {password: "coucoucou", password_confirmation: "coucoucou"}}
    assert_redirected_to password_resets_url
  end
end
