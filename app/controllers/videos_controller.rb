class VideosController < ApplicationController
  def admins
    @video = Video.new
    @genre = Genre.find params[:id]
    @video.genre = @genre
    @videos = VideoDecorator.decorate_collection @genre.videos
  end

  def create
    if admin_signed_in?
      @video = Video.new params[:video]
      @video.genre = Genre.find params[:id]
      if @video.save
        redirect_to admins_videos_url @video.genre
      else
        render action: 'admins'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @video = Video.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @video = Video.find params[:id]
      if @video.update_attributes params[:video]
        redirect_to admins_videos_url(@video.genre)
      else
        render action: 'edit'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @video = Video.find params[:id]
      genre = @video.genre
      @video.destroy
      redirect_to admins_videos_url(genre)
    else
      redirect_to not_found_errors_path
    end
  end
end
