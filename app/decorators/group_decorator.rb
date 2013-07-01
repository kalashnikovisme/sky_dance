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
    if model.space == :there_places
      space_local = "есть места в группе"
    end
    if model.space == :there_not_places
      space_local = "мест в группе нет"
    end
    space_local = "группа формируется"
   end
end
