require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
    @picture = create :picture, user: @user

    sign_in @user
  end

  test "should get index" do
    get picture_url(@picture)
    assert_response :success
  end

  test "should get new" do
    get new_picture_url(@picture)
    assert_response :success
  end

  test "should create picture" do
    image = fixture_file_upload('missing.png', 'image/png')
    assert_difference('Picture.count') do
      post pictures_url, params: { picture: { user_id: @picture.user_id, description: @picture.description, image: image, title: @picture.title } }
    end
    assert_redirected_to picture_url(Picture.last)
  end

  test "should show picture" do
    get picture_url(@picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_url(@picture)
    assert_response :success
  end

  test "should update picture" do
    image = fixture_file_upload('missing.png', 'image/png')
    patch picture_url(@picture), params: { picture: { description: @picture.description, image: image, title: @picture.title } }
    assert_redirected_to picture_url(@picture)
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete picture_url(@picture)
    end
    assert_redirected_to pictures_url
  end
end
