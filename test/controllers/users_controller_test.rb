require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ash = users(:ash)
    @tim = users(:tim)
  end

  test "should get index" do
    get users_url, {}, {'Authorization' => token_header(@ash.auth_token)}
    assert_response :success
  end

  test "should get index filtered by activation" do
    get '/users?is_activated=0', {}, {'Authorization' => token_header(@ash.auth_token)}
    assert_response :success

    users = JSON.parse(response.body, symbolize_names: true)
    activated = users.collect { |user| user[:is_activated] }
    assert_includes activated, false
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, { user: { username: "nouveau", first_name: "nouveau", last_name: "nouveau", email: "nouveau", password: "nouveau" } }, {'Authorization' => token_header(@ash.auth_token)}
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@ash), {}, {'Authorization' => token_header(@ash.auth_token)}
    assert_response :success
  end

  test "should update user" do
    patch user_url(@tim), { user: { username: 'new_tim' } }, {'Authorization' => token_header(@ash.auth_token)}
    assert_response :success
  end

  test "should not update user with fake token" do
    patch user_url(@tim), { user: { username: 'new_tim' } }, {'Authorization' => token_header(@ash.auth_token + "fake")}
    assert_response 401
  end

  test "should login user" do
    @user = User.create!(username: "Grim", first_name: "Grim", last_name: "Grim", email: "Grim", password: "password")

    post '/login', {username: "Grim", password: "password"}
    assert_response :success
  end

  test "should not login fake username" do
    @user = User.create!(username: "Grim", first_name: "Grim", last_name: "Grim", email: "Grim", password: "password")

    post '/login', {username: "fake", password: "password"}
    assert_response 401
    assert 'Invalid Username or Password', response.message
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@ash), {}, {'Authorization' => token_header(@ash.auth_token)}
    end

    assert_response 204
  end
end
