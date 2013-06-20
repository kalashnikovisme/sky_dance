class GroupDecorator < Draper::Decorator
  delegate_all

  def lesson_time(day)
    lesson = model.lessons.find_by_day(day)
    if lesson
      lesson.time.strftime("%H:%M")
    end
  end
end
