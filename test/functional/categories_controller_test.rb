require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
  end


  test "should create category" do
    admin_sign_in @admin

    attributes = attributes_for :category
    post :create, category: attributes
    assert_response :redirect

    category = Category.last
    assert_equal attributes[:describe], category[:describe]
  end

  test "should not create category" do
    attributes = attributes_for :category
    post :create, category: attributes
    assert_redirected_to '/404'
  end
end
