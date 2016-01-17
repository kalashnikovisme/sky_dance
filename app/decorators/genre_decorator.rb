class GenreDecorator < Draper::Decorator
  delegate_all

  decorates_association :groups

  def entry
    if model.description
      "#{model.description.first 140}..."
    end
  end
end
