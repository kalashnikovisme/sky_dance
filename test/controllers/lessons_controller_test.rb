require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @lesson = create :lesson
    @group = create :group
    @photo = create :photo
    @photo.teacher_id = @group.teacher.id
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

  test "should get schedule_pdf" do
    get :schedule_to_pdf
    assert_response :success
  end

  test "should get new" do
    admin_sign_in @admin

    get :new, id: @group
    assert_response :success
  end

  test "should not get new" do
    get :new, id: @group
    assert_redirected_to not_found_errors_path
  end

  test "should create lesson" do
    admin_sign_in @admin

    attributes = attributes_for :lesson
    post :create, id: @group, lesson: attributes
    assert_response :redirect

   # lesson = Lesson.last
   # assert_equal attributes[:time], lesson.time
  end

  test "should not create lesson" do
    attributes = attributes_for :lesson
    post :create, id: @group, lesson: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @lesson
    assert_response :success
  end

  test "should not get edit with no access" do
    get :edit, id: @lesson
    assert_redirected_to not_found_errors_path
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
    assert_redirected_to not_found_errors_path
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
    assert_redirected_to not_found_errors_path
  end
end
