class GenresController < ApplicationController
  def index
    @genres = Genre.all
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
  end
end
