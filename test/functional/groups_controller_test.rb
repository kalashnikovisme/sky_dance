require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @group = create :group
  end

  test "should create group" do
    admin_sign_in @admin

    attributes = attributes_for :group
    post :create, group: attributes
    assert_response :redirect

    group = Group.last
    assert_equal attributes[:category], group.category
  end

  test "should not create group" do
    attributes = attributes_for :group
    post :create, group: attributes
    assert_redirected_to '/404'
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @group
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @group
    assert_redirected_to '/404'
  end

  test "should update group"  do
    admin_sign_in @admin

    attributes = attributes_for :group
    put :update, id: @group, group: attributes
    assert_response :redirect

    @group.reload
    assert_equal attributes[:price], @group.price
  end

  test "should not update with no access" do
    attributes = attributes_for :group
    put :update, id: @group
    assert_redirected_to '/404'
  end

  test "should destroy group" do
    admin_sign_in @admin

    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to lessons_path
  end

  test "should not destroy group" do
    assert_difference('Group.count', 0) do
      delete :destroy, id: @group
    end
    assert_redirected_to '/404'
  end
end
