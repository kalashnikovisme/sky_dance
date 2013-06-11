class VideosController < ApplicationController
  def new
    @video = Video.new
    @video.genre = viewed_genre
  end

  def create
    if admin_signed_in?
      @video = Video.new params[:video]
      @video.genre = viewed_genre
      if @video.save
        redirect_to @video.genre
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end
end
