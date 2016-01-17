require 'test_helper'

class OfficeMapControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @office_map = create :office_map
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @office_map
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @office_map
    assert_redirected_to not_found_errors_path
  end

  test "should update office_map" do
    admin_sign_in @admin

    attributes = attributes_for :office_map
    put :update, id: @office_map, office_map: attributes
    assert_response :redirect

    @office_map.reload
    assert_equal attributes[:link], @office_map.link
  end

  test "should not update office_map with no access" do
    attributes = attributes_for :office_map
    put :update, id: @office_map, office_map: attributes
    assert_redirected_to not_found_errors_path
  end
end
