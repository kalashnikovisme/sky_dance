class GenresController < ApplicationController
  def index
    @genres = GenreDecorator.decorate_collection Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    if admin_signed_in?
      @genre = Genre.new params[:genre]
      if @genre.save
        redirect_to @genre
      else
        render action: "new"
      end
    else
      redirect_to '/404'
    end
  end

  def show
    @genre = Genre.find params[:id]
    set_viewed_genre @genre
  end

  def edit
    if admin_signed_in?
      @genre = Genre.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @genre = Genre.find params[:id]

      if @genre.update_attributes params[:genre]
        redirect_to @genre
      else
        render action: 'edit'
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @genre = Genre.find params[:id]
      @genre.destroy
      redirect_to genres_url
    else
      redirect_to '/404'
    end
  end
end
