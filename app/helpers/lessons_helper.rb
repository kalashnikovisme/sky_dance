module LessonsHelper
  def genre_has_groups?(genre)
    genre.groups.any?
  end

  def group_has_lessons?(group)
    group.lessons.any?
  end

  def group_has_lessons_on_day?(group, day)
    group.find_lesson_by_day(day)
  end
end
