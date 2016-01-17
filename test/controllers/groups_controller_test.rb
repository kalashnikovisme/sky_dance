require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @group = create :group
  end

  test "should get new" do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test "should not get new" do
    get :new
    assert_redirected_to not_found_errors_path
  end

  test "should create group" do
    admin_sign_in @admin

    attributes = attributes_for :group

    genre = create :genre
    teacher = create :teacher
    category = create :category

    attributes[:genre_id] = genre.id
    attributes[:teacher_id] = teacher.id
    attributes[:category_id] = category.id

    post :create, group: attributes
    assert_response :redirect

    group = Group.last
    assert_equal attributes[:category_id], group.category_id
  end

  test "should not create group" do
    attributes = attributes_for :group
    post :create, group: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @group
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @group
    assert_redirected_to not_found_errors_path
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
    assert_redirected_to not_found_errors_path
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
    assert_redirected_to not_found_errors_path
  end
end
