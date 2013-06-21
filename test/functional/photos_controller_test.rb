require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @teacher = create :teacher
    @admin = create :admin
    @photo = create :photo
  end

  test "should create photo" do
    admin_sign_in @admin
    set_viewed_teacher @teacher

    attributes = attributes_for :photo
    post :create, photo: attributes
    assert_response :redirect

    #photo = Photo.last
    #assert_equal attributes[:photo].url, photo[:photo].url
  end

  test "should not create photo" do
    set_viewed_teacher @teacher

    attributes = attributes_for :photo
    post :create, photo: attributes
    assert_redirected_to '/404'
  end

  test "should destroy photo" do
    admin_sign_in @admin

    teacher = @photo.teacher
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to admins_photo_teacher_url
  end

  test "should not destroy photo with no access" do
    assert_difference('Photo.count', 0) do
      delete :destroy, id: @photo
    end
    assert_redirected_to '/404'
  end
end
