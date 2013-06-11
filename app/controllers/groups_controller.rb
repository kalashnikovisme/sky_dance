class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    if admin_signed_in?
      @group = Group.new params[:group]
      if @group.save
        redirect_to schedule_path
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def edit
    if admin_signed_in?
      @group = Group.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @group = Group.find params[:id]
      if @group.update_attributes params[:group]
        redirect_to schedule_path
      else
        render action: 'edit'
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @group = Group.find params[:id]
      @group.destroy
      redirect_to schedule_path
    else
      redirect_to '/404'
    end
  end
end
