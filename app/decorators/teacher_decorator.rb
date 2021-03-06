class TeacherDecorator < Draper::Decorator
  delegate_all

  def first_photo_thumb
    if model.photos.any?
      model.photos.first.photo.thumb
    else
      "#{Rails.root}/app/assets/images/user.jpg"
    end
  end

  def first_photo
    if model.photos.any?
      model.photos.first.photo
    end
  end

  def first_photo_big_thumb
    if model.photos.any?
      model.photos.first.photo.big_thumb
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
