class LessonDecorator < Draper::Decorator
  delegate_all

  def coming_time
    lesson.time.strftime "%H:%M"
  end
end
