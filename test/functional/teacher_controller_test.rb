require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    @teacher = create :teacher
    @admin = create :admin
  end
 
  test 'should create teacher' do
    admin_sign_in @admin
    
    attributes = attributes_for :teacher
    post :create, teacher: attributes
    assert_response :redirect

    teacher = Teacher.last
    assert_equal attributes[:first_name], teacher.first_name
  end

  test 'should not create teacher without no access' do
    attributes = attributes_for :teacher
    post :create, teacher: attributes
    assert_redirected_to '/404'
  end

  test 'should show teacher' do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns :teachers
  end

  test "should get new" do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test "should get edit" do
    admin_sign_in @admin  

    get :edit, id: @teacher
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @teacher
    assert_redirected_to '/404'
  end

  test "should update teacher" do
    admin_sign_in @admin
 
    attributes = attributes_for :teacher
    put :update, id: @teacher, teacher: attributes
    assert_response :redirect

    @teacher.reload
    assert_equal attributes[:first_name], @teacher.first_name
  end

  test "should not update teacher with no access" do
    attributes = attributes_for :teacher
    put :update, id: @teacher, teacher: attributes
    assert_redirected_to '/404'
  end
end
