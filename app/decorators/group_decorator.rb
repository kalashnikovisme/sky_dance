class GroupDecorator < Draper::Decorator
  delegate_all

  def lesson_time(day)
    #FIXME
    lesson = model.lessons.find_by_day("---\n- #{day}\n")
    if lesson
      lesson.time.strftime("%H:%M")
    end
  end

  def find_lesson_by_day(day)
    #FIXME
    model.lessons.find_by_day("---\n- #{day}\n")
  end

  def space_locale
    if model.space.there_places?
      "good"
    elsif model.space.there_not_places?
      "bad"
    elsif model.space.group_formed?
      "not bad"
    end
  end
end
