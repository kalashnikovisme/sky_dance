class TeachersController < ApplicationController
  def new
    if admin_signed_in?
      @teacher = Teacher.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @teacher = Teacher.new params[:teacher]
      if @teacher.save
        redirect_to @teacher, flash: :success
      else
        render action: :new
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def show
    @teacher = Teacher.find(params[:id]).decorate
  end

  def index
    @teachers = TeacherDecorator.decorate_collection Teacher.all
  end

  def edit
    if admin_signed_in?
      @teacher = Teacher.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @teacher = Teacher.find params[:id]

      if @teacher.update_attributes params[:teacher]
        redirect_to @teacher, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @teacher = Teacher.find params[:id]
      @teacher.destroy
      redirect_to teachers_url, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
