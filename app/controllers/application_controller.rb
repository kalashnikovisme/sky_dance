class ApplicationController < ActionController::Base
  include AuthHelper

  protect_from_forgery

  protected

  def need_days
    @days = Lesson.day.values
  end
end
