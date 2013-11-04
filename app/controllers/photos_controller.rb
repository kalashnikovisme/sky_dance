class PhotosController < ApplicationController

  def admins
    @photo = Photo.new
    @teacher = Teacher.find params[:id]
    @photos = @teacher.photos
  end

  def create
    if admin_signed_in?
      @photo = Photo.new params[:photo]
      @photo.teacher = Teacher.find params[:id]
      if @photo.save
        redirect_to admins_photos_url @photo.teacher, flash: :success
      else
        render action: 'admins'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @photo = Photo.find params[:id]
      teacher = @photo.teacher
      @photo.destroy
      redirect_to admins_photos_url teacher, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
