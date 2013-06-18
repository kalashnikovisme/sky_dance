class VideoDecorator < Draper::Decorator
  delegate_all

  def from_youtube
    if model.link
      helpers.content_tag :iframe,  :width => "350",
                                    :height => "197",
                                    :src => "http://www.youtube.com/embed/#{model.link.split('=')[1]}",
                                    :frameborder => "0",
                                    :allowfullscreen => "" do
      end
    end
  end

end
