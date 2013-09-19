require 'test_helper'

class UnlimitsControllerTest < ActionController::TestCase
  setup do
    @unlimit = create :unlimit
    @admin = create :admin
  end

  test "should edit unlimit" do
    admin_sign_in @admin

    get :edit, id: @unlimit
    assert_response :success
  end

  test "should update unlimit" do
    admin_sign_in @admin

    attributes = attributes_for :unlimit
    post :update, id: @unlimit, unlimit: attributes
    assert_response :redirect

    @unlimit.reload
    assert_equal attributes[:price], @unlimit.price
  end
end
