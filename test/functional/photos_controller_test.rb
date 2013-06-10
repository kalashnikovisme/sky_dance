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
  end
end
