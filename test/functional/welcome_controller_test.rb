require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    @video = create :video
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
