require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @genre = create :genre
  end

  test "should create video" do
    admin_sign_in @admin
    set_viewed_genre @genre

    attributes = attributes_for :video
    post :create, video: attributes
    assert_response :redirect
  end

  test "should not create video" do
    set_viewed_genre @genre

    attributes = attributes_for :video
    post :create, video: attributes
    assert_redirected_to '/404'
  end
end
