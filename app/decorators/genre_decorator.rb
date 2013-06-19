class GenreDecorator < Draper::Decorator
  delegate_all

  def entry
    if model.description
      model.description.first 140
    end
  end
end
