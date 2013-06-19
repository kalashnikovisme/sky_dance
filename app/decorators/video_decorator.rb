class VideoDecorator < Draper::Decorator
  delegate_all

  def from_youtube(width = 350, height = 197)
    if model.link
      helpers.content_tag :iframe,  :width => width,
                                    :height => height,
                                    :src => "http://www.youtube.com/embed/#{model.link.split('=')[1]}",
                                    :frameborder => "0",
                                    :allowfullscreen => "" do
      end
    end
  end

end
