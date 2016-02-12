module TeachersHelper
  def index_multiple_four?(index)
    index % 4 == 0
  end

  def teacher_view?
    request.url.include? 'teacher'
  end
end
