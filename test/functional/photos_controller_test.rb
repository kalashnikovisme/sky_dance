require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @teacher = create :teacher
    @admin = create :admin
    @photo = create :photo
  end

  test "should get admins" do
    admin_sign_in @admin

    get :admins, id: @teacher
    assert_response :success
  end

  test "should not get admins" do
    get :admins, id: @teacher
    assert_response :success
  end

  test "should create photo" do
    admin_sign_in @admin

    attributes = attributes_for :photo
    post :create, id: @teacher, photo: attributes
    assert_response :redirect

    #photo = Photo.last
    #assert_equal attributes[:photo].url, photo[:photo].url
  end

  test "should not create photo" do
    attributes = attributes_for :photo
    post :create, id: @teacher, photo: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should destroy photo" do
    admin_sign_in @admin

    teacher = @photo.teacher
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to admins_photos_url teacher, flash: :success
  end

  test "should not destroy photo with no access" do
    assert_difference('Photo.count', 0) do
      delete :destroy, id: @photo
    end
    assert_redirected_to not_found_errors_path
  end
end
