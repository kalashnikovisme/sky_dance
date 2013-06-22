class VideosController < ApplicationController
  def admins
    @video = Video.new
    @video.genre = viewed_genre
    @genre = Genre.find params[:id]
    @videos = VideoDecorator.decorate_collection @genre.videos
  end

  def create
    if admin_signed_in?
      @video = Video.new params[:video]
      @video.genre = @genre
      if @video.save
        redirect_to admins_video_genre_url(@video.genre)
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def edit
    if admin_signed_in?
      @video = Video.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @video = Video.find params[:id]
      if @video.update_attributes params[:video]
        redirect_to admins_video_genre_url(@video.genre)
      else
        render action: 'edit'
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @video = Video.find params[:id]
      @video.destroy
      redirect_to admins_video_genre_path
    else
      redirect_to '/404'
    end
  end
end
