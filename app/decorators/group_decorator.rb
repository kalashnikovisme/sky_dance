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

  def space_identificator
    if model.space.there_places?
      helpers.content_tag :div, class: "there_places ident" do
      end
    elsif model.space.there_not_places?
      helpers.content_tag :div, class: "there_not_places ident" do
      end
    elsif model.space.group_formed?
      helpers.content_tag :div, class: "group_formed ident" do
      end
    end
  end
end
