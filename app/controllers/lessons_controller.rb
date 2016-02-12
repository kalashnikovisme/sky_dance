require 'prawn'

class LessonsController < ApplicationController
  before_filter :need_days, only: :schedule
  before_filter :format_time, only: [ :create, :update ]

  def schedule
    @genres = GenreDecorator.decorate_collection Genre.all
    @lessons = Lesson.all
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

  private

  def format_time
    params[:lesson][:time] = Time.new params[:lesson]['time(1i)'].to_i,
				      params[:lesson]['time(2i)'].to_i,
				      params[:lesson]['time(3i)'].to_i,
				      params[:lesson]['time(4i)'].to_i + 3,
				      params[:lesson]['time(5i)'].to_i,
				      params[:lesson]['time(6i)'].to_i
  end
end
