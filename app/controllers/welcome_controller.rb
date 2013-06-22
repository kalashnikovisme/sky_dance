class WelcomeController < ApplicationController

  def index
    @genres = Genre.all
    #@news = News.first 3
    @photos_bottom = Photo.last 3
    @teachers = TeacherDecorator.decorate_collection Teacher.all.shuffle!
    @video = Video.last.decorate if Video.any?
  end

  def contacts
  end

  def about
  end

end
