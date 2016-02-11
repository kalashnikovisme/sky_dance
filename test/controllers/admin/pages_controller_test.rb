require 'test_helper'

class Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @page = create :page
  end

  test 'should get new' do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test 'should not get new' do
    get :new
    assert_redirected_to not_found_errors_path
  end

  test 'should create page' do
    admin_sign_in @admin

    attributes = attributes_for :page

    post :create, page: attributes
    assert_response :redirect

    page = Page.last
    assert_equal attributes[:body], page.body
  end

  test 'should not create page' do
    attributes = attributes_for :page
    post :create, page: attributes
    assert_redirected_to not_found_errors_path
  end

  test 'should get edit' do
    admin_sign_in @admin

    get :edit, id: @page
    assert_response :success
  end

  test 'should not get edit with no access' do
    get :edit, id: @page
    assert_redirected_to not_found_errors_path
  end

  test 'should update page'  do
    admin_sign_in @admin

    attributes = attributes_for :page
    put :update, id: @page, page: attributes
    assert_response :redirect

    @page.reload
    assert_equal attributes[:body], @page.body
  end

  test 'should not update with no access' do
    attributes = attributes_for :page
    attributes[:title] = nil
    put :update, id: @page, page: attributes
    assert_redirected_to not_found_errors_path
  end

  test 'should destroy page' do
    admin_sign_in @admin

    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to admin_pages_path
  end

  test 'should not destroy page' do
    assert_difference('Page.count', 0) do
      delete :destroy, id: @page
    end
    assert_redirected_to not_found_errors_path
  end
end
