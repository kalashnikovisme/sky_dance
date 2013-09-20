require 'test_helper'

class UnlimitsControllerTest < ActionController::TestCase
  setup do
    @unlimit = create :unlimit
    @admin = create :admin
  end

  test "should edit unlimit" do
    admin_sign_in @admin

    get :edit
    assert_response :success
  end

  test "should update unlimit" do
    admin_sign_in @admin

    attributes = attributes_for :unlimit
    post :update, unlimit: attributes
    assert_response :redirect

    assert_equal attributes[:price], Unlimit.first.price
  end
end
