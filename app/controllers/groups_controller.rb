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
end
