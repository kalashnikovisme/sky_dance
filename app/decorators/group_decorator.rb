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
  def there_places_locale
    "есть места в группе"
  end

  def there_not_places_locale
    "мест в группе нет"
  end

  def group_formed_locale
    "группа формируется"
  end
end
