class NewsDecorator < Draper::Decorator
  delegate_all

  def main_photo
    if model && model.photo
      photo
    end
  end

  def main_photo_thumb
    if model && model.photo
      photo.thumb
    end
  end

  def lead
    body.first 140
  end
end
