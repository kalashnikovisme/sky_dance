class TeacherPhotosController < ApplicationController
  def new
    if admin_signed_in?
      @teacher_photo = TeacherPhoto.new params[:teacher_photo]
      #binding.pry
      #@teacher_photo.teacher_id = session[:teacher_id]
    else
      redirect_to '/404'
    end
  end

  def create
    if admin_signed_in?
      @teacher_photo = TeacherPhoto.new params[:teacher_photo]
      @teacher_photo.teacher = Teacher.find(session[:teacher_id])
      if @teacher_photo.save
        redirect_to @teacher_photo.teacher
      else
        render action: "new"
      end
    else
      redirect_to '/404'
    end
  end
end
