class GenresController < ApplicationController
  def index
    @genres = GenreDecorator.decorate_collection Genre.all
  end

  def new
    if admin_signed_in?
      @genre = Genre.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @genre = Genre.new params[:genre]
      if @genre.save
        redirect_to @genre, flash: :success
      else
        render action: "new"
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def show
    @genre = Genre.find params[:id]
  end

  def edit
    if admin_signed_in?
      @genre = Genre.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @genre = Genre.find params[:id]

      if @genre.update_attributes params[:genre]
        redirect_to @genre, flash: :success
      else
        render action: 'edit'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @genre = Genre.find params[:id]
      @genre.destroy
      redirect_to genres_url, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
