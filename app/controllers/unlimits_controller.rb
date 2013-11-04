class UnlimitsController < ApplicationController
  def edit
    if admin_signed_in?
      @unlimit = Unlimit.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @unlimit = Unlimit.find params[:id]
      if @unlimit.update_attributes params[:unlimit]
        redirect_to schedule_path, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def new
    if admin_signed_in?
      @unlimit = Unlimit.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @unlimit = Unlimit.new params[:unlimit]
      if @unlimit.save
        redirect_to schedule_path, flash: :success
      else
        render action: :new
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @unlimit = Unlimit.find params[:id]
      @unlimit.destroy
      redirect_to schedule_path, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
