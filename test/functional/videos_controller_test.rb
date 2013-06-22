require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @genre = create :genre
    @video = create :video
  end

  test "should create video" do
    admin_sign_in @admin

    attributes = attributes_for :video
    post :create, id: @genre, video: attributes
    assert_response :redirect
  end

  test "should not create video" do
    attributes = attributes_for :video
    post :create, id: @genre, video: attributes
    assert_redirected_to '/404'
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @video
    assert_response :success
  end

  test "should not edit with no access" do
    get :edit, id: @video
    assert_redirected_to '/404'
  end

  test "should update video" do
    admin_sign_in @admin

    attributes = attributes_for :video
    put :update, id: @video, video: attributes
    assert_response :redirect

    @video.reload
    assert_equal attributes[:link], @video.link
  end

  test "should not update with no access" do
    attributes = attributes_for :video
    put :update, id: @video
    assert_redirected_to '/404'
  end

  #test "should destroy video" do
  #  admin_sign_in @admin

   # assert_difference('Video.count', -1) do
   #   delete :destroy, id: @video
   # end
  #end

  test "should not destroy video" do
    assert_difference('Video.count', 0) do
      delete :destroy, id: @video
    end
    assert_redirected_to '/404'
  end
end
