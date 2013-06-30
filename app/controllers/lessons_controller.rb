class LessonsController < ApplicationController

  def schedule
    @genres = Genre.all
    @lessons = Lesson.all
    #FIXME
    @days = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  end

  def new
    if admin_signed_in?
      @lesson = Lesson.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @lesson = Lesson.new params[:lesson]
      @lesson.group = Group.find params[:id]
      if @lesson.save
        redirect_to schedule_path
      else
        render action: 'new'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      if @lesson.update_attributes params[:lesson]
        redirect_to lessons_path
      else
        render action: 'edit'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      @lesson.destroy
      redirect_to lessons_path
    else
      redirect_to not_found_errors_path
    end
  end
end
