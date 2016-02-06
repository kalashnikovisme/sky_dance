class TeachersController < ApplicationController
  before_filter :need_days, only: :show

  def new
    if admin_signed_in?
      @teacher = TeacherForm.new_with_model
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @teacher = TeacherForm.new_with_model
      if @teacher.submit params[:teacher]
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
    @teachers = Teacher.all.decorate
  end

  def edit
    if admin_signed_in?
      @teacher = TeacherForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @teacher = TeacherForm.find_with_model params[:id]
      if @teacher.submit params[:teacher]
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
