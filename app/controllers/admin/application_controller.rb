class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin!

  private

  def current_user
    @_current_user ||= Admin.find_by(id: session[:admin_id])
  end

  def signed_in?
    current_user
  end

  def signed_as_admin?
    signed_in? && current_user.is_a?(Admin)
  end

  def authenticate_admin!
    redirect_to new_session_path unless signed_as_admin?
  end
end
