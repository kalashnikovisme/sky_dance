class GroupsController < ApplicationController
  def new
    if admin_signed_in?
      @group = Group.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @group = Group.new params[:group]
      if @group.save
        redirect_to schedule_path, flash: :success
      else
        render action: 'new'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @group = Group.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @group = Group.find params[:id]
      if @group.update_attributes params[:group]
        redirect_to schedule_path, flash: :success
      else
        render action: 'edit'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @group = Group.find params[:id]
      @group.destroy
      redirect_to lessons_path, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
