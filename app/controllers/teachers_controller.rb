class TeachersController < ApplicationController
  def new
    if admin_signed_in?
      @teacher = Teacher.new
    else
      redirect_to '/404'
    end
  end

  def create
    if admin_signed_in?
      @teacher = Teacher.new params[:teacher]
      if @teacher.save
        redirect_to @teacher
      else
        render action: "new"
      end
    else
      redirect_to '/404'
    end
  end

  def show
    @teacher = Teacher.find params[:id]
    session[:teacher_id] = @teacher.id
  end

  def index
    @teachers = Teacher.all
  end

  def edit
    if admin_signed_in?
      @teacher = Teacher.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @teacher = Teacher.find params[:id]

      if @teacher.update_attributes params[:teacher]
        redirect_to @teacher
      else
        render action: "edit"
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @teacher = Teacher.find params[:id]
      @teacher.destroy
      redirect_to teachers_url
    else
     redirect_to '/404'
    end
  end
end
