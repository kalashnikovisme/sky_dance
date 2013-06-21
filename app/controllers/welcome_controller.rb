class WelcomeController < ApplicationController

  def index
    @genres = Genre.all
    #@news = News.first 3
    @photos_bottom = Photo.last 3
    @teachers = TeacherDecorator.decorate_collection Teacher.all.shuffle!
    if Video.any?
      @video = Video.last.decorate
    end
  end

  def contacts
  end

  def about
  end

end
