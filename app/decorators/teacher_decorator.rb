class TeacherDecorator < Draper::Decorator
  delegate_all

  def first_photo
    if model.photos.any?
      helpers.content_tag :img, src: model.photos.first.photo do
      end
    end
  end

  def fio
    "#{model.first_name} #{model.middle_name}"
  end

  def genres
    genres = []
    model.groups.each do |group|
      genres.push(group.genre)
    end
    genres.uniq
  end
end
