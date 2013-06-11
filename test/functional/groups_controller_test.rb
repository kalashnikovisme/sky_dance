require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
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
end
