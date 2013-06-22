class PhotosController < ApplicationController

  def admins
    @photo = Photo.new
    @photos = viewed_teacher.photos
  end

  def create
    if admin_signed_in?
      @photo = Photo.new params[:photo]
      @photo.teacher = viewed_teacher
      if @photo.save
        redirect_to admins_photo_teacher_url(@photo.teacher)
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @photo = Photo.find params[:id]
      teacher = @photo.teacher
      @photo.destroy
      redirect_to admins_photo_teacher_path
    else
      redirect_to '/404'
    end
  end
end
