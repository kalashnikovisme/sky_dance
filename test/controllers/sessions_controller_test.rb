require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
  end

  test 'new' do
    get :new
    assert_response :success
  end

  test 'create ok' do
    post :create, admin: { login: @admin.login, password: @admin.password }
    assert_response :redirect
    assert admin_signed_in?, @response.body
  end

  test 'create wrong password' do
    post :create, admin: { login: @admin.login, password: '123' }
    assert_response :success
    assert !admin_signed_in?
  end

  test 'destroy' do
    admin_sign_in @admin
    delete :destroy
    assert_response :redirect
    assert !admin_signed_in?
  end
end
