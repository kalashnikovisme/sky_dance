class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by_login params[:admin][:login]
    if @admin
      if @admin.authenticate params[:admin][:password]
        admin_sign_in @admin
        redirect_to admin_welcome_index_path
      else
        render :new
      end
    else
      @admin = Admin.new
      render :new
    end
  end

  def destroy
    admin_sign_out
    redirect_to root_path
  end
end
