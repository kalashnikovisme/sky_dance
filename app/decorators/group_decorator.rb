class GroupDecorator < Draper::Decorator
  delegate_all

  def lesson_time(day)
    #FIXME
    lesson = model.lessons.find_by_day("---\n- #{day}\n")
    if lesson
      lesson.time.strftime "%H:%M"
    else
      lesson = model.lessons.find_by_day(day)
      if lesson
        lesson.time.strftime "%H:%M"
      end
    end
  end

  def find_lesson_by_day(day)
    #FIXME
    lesson = model.lessons.find_by_day("---\n- #{day}\n")
    unless lesson
      lesson = model.lessons.find_by_day(day)
    end
    lesson
  end
end
