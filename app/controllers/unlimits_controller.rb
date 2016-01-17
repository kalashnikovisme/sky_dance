class UnlimitsController < ApplicationController
  def edit
    if admin_signed_in?
      @unlimit = UnlimitForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @unlimit = UnlimitForm.find_with_model params[:id]
      if @unlimit.submit params[:unlimit]
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
      @unlimit = UnlimitForm.new_with_model
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @unlimit = UnlimitForm.new_with_model
      if @unlimit.submit params[:unlimit]
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
