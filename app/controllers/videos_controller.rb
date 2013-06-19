class VideosController < ApplicationController
  def new
    @video = Video.new
    @video.genre = viewed_genre
  end

  def create
    if admin_signed_in?
      @video = Video.new params[:video]
      #FIXME
      @genre = viewed_genre
      @video.genre = @genre
      if @video.save
        redirect_to @video.genre
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
        redirect_to @video.genre
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
    else
      redirect_to '/404'
    end
  end
end
