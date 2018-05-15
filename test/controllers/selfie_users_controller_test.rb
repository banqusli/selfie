require 'test_helper'

class SelfieUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selfie_user = selfie_users(:one)
  end

  test "should get index" do
    get selfie_users_url
    assert_response :success
  end

  test "should get new" do
    get new_selfie_user_url
    assert_response :success
  end

  test "should create selfie_user" do
    assert_difference('SelfieUser.count') do
      post selfie_users_url, params: { selfie_user: { email: @selfie_user.email, name: @selfie_user.name, user_id: @selfie_user.user_id } }
    end

    assert_redirected_to selfie_user_url(SelfieUser.last)
  end

  test "should show selfie_user" do
    get selfie_user_url(@selfie_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_selfie_user_url(@selfie_user)
    assert_response :success
  end

  test "should update selfie_user" do
    patch selfie_user_url(@selfie_user), params: { selfie_user: { email: @selfie_user.email, name: @selfie_user.name, user_id: @selfie_user.user_id } }
    assert_redirected_to selfie_user_url(@selfie_user)
  end

  test "should destroy selfie_user" do
    assert_difference('SelfieUser.count', -1) do
      delete selfie_user_url(@selfie_user)
    end

    assert_redirected_to selfie_users_url
  end
end
