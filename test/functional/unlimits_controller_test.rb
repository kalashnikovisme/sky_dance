require 'test_helper'

class UnlimitsControllerTest < ActionController::TestCase
  setup do
    @unlimit = create :unlimit
    @admin = create :admin
  end

  test 'should create unlimit' do
    admin_sign_in @admin

    attributes = attributes_for :unlimit
    post :create, unlimit: attributes
    assert_response :redirect

    unlimit = Unlimit.last
    assert_equal attributes[:price], unlimit.price
  end

  test 'should not create unlimit without no access' do
    attributes = attributes_for :unlimit
    post :create, unlimit: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should get new" do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test 'should not get new' do
    get :new
    assert_redirected_to not_found_errors_path
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @unlimit
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @unlimit
    assert_redirected_to not_found_errors_path
  end

  test "should update unlimit" do
    admin_sign_in @admin

    attributes = attributes_for :unlimit
    put :update, id: @unlimit, unlimit: attributes
    assert_response :redirect

    @unlimit.reload
    assert_equal attributes[:price], @unlimit.price
  end

  test "should not update unlimit with no access" do
    attributes = attributes_for :unlimit
    put :update, id: @unlimit, unlimit: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should destroy unlimit" do
    admin_sign_in @admin

    assert_difference('Unlimit.count', -1) do
      delete :destroy, id: @unlimit
    end

    assert_redirected_to schedule_path
  end

  test "should not destroy unlimit" do
    assert_difference('Unlimit.count', 0) do
      delete :destroy, id: @unlimit
    end
    assert_redirected_to not_found_errors_path
  end
end
