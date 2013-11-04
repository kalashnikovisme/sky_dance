class OfficeMapController < ApplicationController

  def edit
    if admin_signed_in?
      @office_map = OfficeMap.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @office_map = OfficeMap.find params[:id]
      if @office_map.update_attributes params[:office_map]
        redirect_to schedule_path, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end
end
