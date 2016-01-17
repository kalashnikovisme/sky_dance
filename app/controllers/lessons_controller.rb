require 'prawn'

class LessonsController < ApplicationController
  def schedule
    @genres = GenreDecorator.decorate_collection Genre.all
    @lessons = Lesson.all
    @days = Lesson.day.values
    @unlimits = Unlimit.all
  end

  def schedule_to_pdf
    output = ScheduleReport.new.to_pdf
    send_data output, type: 'application/pdf', filename: 'schedule.pdf'
  end

  def new
    if admin_signed_in?
      @lesson = LessonForm.new_with_model
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      params[:lesson].merge! group_id: params[:id]
      @lesson = LessonForm.new_with_model
      if @lesson.submit params[:lesson]
        redirect_to schedule_path, flash: :success
      else
        render action: :new
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @lesson = LessonForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @lesson = LessonForm.find_with_model params[:id]
      if @lesson.submit params[:lesson]
        redirect_to lessons_path, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      @lesson.destroy
      redirect_to lessons_path, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
