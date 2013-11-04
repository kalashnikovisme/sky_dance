module WelcomeHelper
  include AutoHtml

  def google_map(link)
    auto_html link do
      google_map
    end
  end
end
