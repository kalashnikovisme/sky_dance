module WelcomeHelper
  include AutoHtml

  def office_on_google_map
    office_on_google_maps_link = "https://maps.google.ru/maps?q=ульяновск+2+переулок+мира+24"
    auto_html office_on_google_maps_link do
      google_map link_text: I18n.t('.view_map')
    end
  end
end
