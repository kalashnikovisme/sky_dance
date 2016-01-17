class Admin::WelcomeController < Admin::ApplicationController
  def index
    @office_map = OfficeMap.first
  end
end
