class GroupDecorator < Draper::Decorator
  delegate_all

  def lesson_time(day)
    lesson = model.lessons.find_by_day(day)
    if lesson
      lesson.time.strftime("%H:%M")
    end
  end

  def find_lesson_by_day(day)
    model.lessons.find_by_day(day)
  end

  def price_rub
    #FIXME
    "#{model.price} руб."
  end

  def once_price_rub
    #FIXME
    "#{model.once_price} руб."
  end

  #FIXME
  def space_locale
    if model.space === "there_places"
      space_local = "есть места в группе"
    end
    if model.space === "there_not_places"
      space_local = "мест в группе нет"
    end
    space_local = "группа формируется"
  end
end
