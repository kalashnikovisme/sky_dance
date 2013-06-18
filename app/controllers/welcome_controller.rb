class WelcomeController < ApplicationController

  def index
    @genres = Genres.all
    @news = News.first 3
    @video = Video.last
    @photos_bottom = Photo.last 3
    @photos_top = Photo.all
  end

end
