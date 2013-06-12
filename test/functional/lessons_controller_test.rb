require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @lesson = create :lesson
  end

  test "should create lesson" do
    admin_sign_in @admin

    attributes = attributes_for :lesson
    post :create, lesson: attributes
    assert_response :redirect

   # lesson = Lesson.last
   # assert_equal attributes[:time], lesson.time
  end

  test "should not create lesson" do
    attributes = attributes_for :lesson
    post :create, lesson: attributes
    assert_redirected_to '/404'
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @lesson
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @lesson
    assert_redirected_to '/404'
  end

  test "should update lesson" do
    admin_sign_in @admin

    attributes = attributes_for :lesson
    put :update, id: @lesson, lesson: attributes
    assert_response :redirect

  #  @lesson.reload
  #  assert_equal attributes[:time].time, @lesson.time.time
  end

  test "should not update with no access" do
    attributes = attributes_for :lesson
    put :update, id: @lesson
    assert_redirected_to '/404'
  end

  test "should destroy lesson" do
    admin_sign_in @admin

    assert_difference('Lesson.count', -1) do
      delete :destroy, id: @lesson
    end

    assert_redirected_to lessons_path
  end

  test "should not destroy lesson" do
    assert_difference('Lesson.count', 0) do
      delete :destroy, id: @lesson
    end
    assert_redirected_to '/404'
  end
end
