module WelcomeHelper
  include AutoHtml

  def office_on_google_map
    if OfficeMap.any?
      office_on_google_maps_link = OfficeMap.first.link
      auto_html office_on_google_maps_link do
        google_map link_text: I18n.t('.view_map')
      end
    end
  end

  def any_office_maps?
    OfficeMap.any?
  end
end
