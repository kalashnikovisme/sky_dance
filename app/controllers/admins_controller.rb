class AdminsController < ApplicationController
  def login
    @admin = Admin.new
    if admin_signed_in?
      redirect_to panel_admins_path
    else
      @admin = Admin.find_by_login params[:login]
      if @admin && authenticate_admin?(@admin, params[:password])
        admin_sign_in @admin
        redirect_to panel_admins_path
      else
        flash[:notice] = t 'wrong_login'
      end
    end
  end

  def logout
    admin_sign_out
    redirect_to :root
  end

  def panel
  end
end
