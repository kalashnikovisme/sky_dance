class VideosController < ApplicationController
  def admins
    @video = Video.new
    @genre = Genre.find params[:id]
    @video.genre = @genre
    @videos = VideoDecorator.decorate_collection @genre.videos
  end

  def create
    if admin_signed_in?
      params[:video].merge! genre_id: params[:id]
      @video = VideoForm.new_with_model
      if @video.submit params[:video]
        redirect_to admins_videos_url @video.genre, flash: :success
      else
        render action: :admins
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @video = VideoForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @video = VideoForm.find_with_model params[:id]
      if @video.submit params[:video]
        redirect_to admins_videos_url @video.genre, flash: :success
      else
        render action: :edit
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
      redirect_to admins_videos_url genre, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
