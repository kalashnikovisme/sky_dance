require 'test_helper'

class TeacherPhotosControllerTest < ActionController::TestCase
  setup do
    @teacher = create :teacher
    @admin = create :admin
  end

  test 'should get new' do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test 'should not get new' do
    get :new
    assert_redirected_to '/404'
  end

  test 'should create teacher' do
    admin_sign_in @admin
    
    attributes = attributes_for :teacher_photo
    post :create, teacher_photo: attributes
    assert_response :redirect
  end

  test 'should not create teacher without no access' do
    attributes = attributes_for :teacher
    post :create, teacher: attributes
    assert_redirected_to '/404'
  end
end
