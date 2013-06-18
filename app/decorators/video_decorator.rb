class VideoDecorator < Draper::Decorator
  delegate_all

  def from_youtube
    if model.link
      helpers.content_tag :iframe,  :width => "560",
                                    :height => "315",
                                    :src => "http://www.youtube.com/embed/#{model.link.split('=')[1]}",
                                    :frameborder => "0",
                                    :allowfullscreen => "" do
      end
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
