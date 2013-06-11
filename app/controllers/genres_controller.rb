class GenresController < ApplicationController
  def index
    @genres = Genre.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genres }
    end
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
    @genre = Genre.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @genre }
    end
  end
end
