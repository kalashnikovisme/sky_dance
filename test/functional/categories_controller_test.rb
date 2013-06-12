require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @category = create :category
  end


  test "should create category" do
    admin_sign_in @admin

    attributes = attributes_for :category
    post :create, category: attributes
    assert_response :redirect

    category = Category.last
    assert_equal attributes[:describe], category.describe
  end

  test "should not create category" do
    attributes = attributes_for :category
    post :create, category: attributes
    assert_redirected_to '/404'
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @category
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @category
    assert_redirected_to '/404'
  end

  test "should update category" do
    admin_sign_in @admin

    attributes = attributes_for :category
    put :update, id: @category, category: attributes
    assert_response :redirect

    @category.reload
    assert_equal attributes[:describe], @category.describe
  end

  test "should not update with no access" do
    attributes = attributes_for :category
    put :update, id: @category
    assert_redirected_to '/404'
  end

  test "should destroy category" do
    admin_sign_in @admin

    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to lessons_path
  end

  test "should not destroy category" do
    assert_difference('Category.count', 0) do
      delete :destroy, id: @category
    end
    assert_redirected_to '/404'
  end
end
