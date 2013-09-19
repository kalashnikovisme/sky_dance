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
        redirect_to schedule_path
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end
end
