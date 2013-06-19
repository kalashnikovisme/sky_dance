class TeacherDecorator < Draper::Decorator
  delegate_all

  def first_photo
    if model.photos.first
      helpers.content_tag :img, src: model.photos.first.photo do
      end
    end
  end

  def fio
    "#{model.first_name} #{model.middle_name}"
  end

  def entry
    if model.description
      model.description.first 140
    end
  end
end
