require 'test_helper'

class TeacherDecoratorTest < Draper::TestCase
  setup do
    @teacher = create :teacher
  end

  test "should decorated on index" do
    get :index
    assert_response :be_decorated
  end
end
