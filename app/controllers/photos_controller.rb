class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @photo.teacher = viewed_teacher
  end

  def create
    if admin_signed_in?
      @photo = Photo.new params[:photo]
      @photo.teacher = viewed_teacher
      if @photo.save
        redirect_to @photo.teacher
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end
end
