class WelcomeController < ApplicationController

  def index
    @genres = Genre.all
    #@news = News.first 3
    @video = Video.last
    @photos_bottom = Photo.last 3
    @teachers = TeacherDecorator.decorate_collection Teacher.all.shuffle!
  end

  def contacts
  end

  def about
  end

end
