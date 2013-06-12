require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @teacher = create :teacher
    @admin = create :admin
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
end
