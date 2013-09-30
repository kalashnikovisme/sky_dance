class WelcomeController < ApplicationController

  def index
    @genres = Genre.all
    @news = NewsDecorator.decorate_collection News.last 3
    @news = @news.reverse
    @photos_bottom = Photo.last 3
    @teachers = TeacherDecorator.decorate_collection Teacher.all.shuffle!
    @video = Video.last.decorate if Video.any?
  end

  def contacts
  end

  def about
  end

end
