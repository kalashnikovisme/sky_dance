class LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
  end

  def create
    if admin_signed_in?
      @lesson = Lesson.new params[:lesson]
      if @lesson.save
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
      @lesson = Lesson.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      if @lesson.update_attributes params[:lesson]
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
      @lesson = Lesson.find params[:id]
      @lesson.destroy
      redirect_to schedule_path
    else
      redirect_to '/404'
    end
  end
end
