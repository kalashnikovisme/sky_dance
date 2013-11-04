class VideoDecorator < Draper::Decorator
  delegate_all

  include AutoHtml

  def from_youtube(width = 350, height = 197)
    if model.link
      auto_html model.link do
        youtube width: width, height: height
      end
    end
  end

end
