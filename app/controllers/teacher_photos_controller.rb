class TeacherPhotosController < ApplicationController
  def new
    @teacher_photo = TeacherPhoto.new params[:teacher_photo]
  end

  def create
    if admin_signed_in?
      @teacher_photo = TeacherPhoto.new params[:teacher_photo]
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
