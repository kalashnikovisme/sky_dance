class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end
  
  def create
    if admin_signed_in?
      @teacher = Teacher.new params[:teacher]
      if @teacher.save
        redirect_to @teacher
      else
        render action: "new"
      end
    else
      redirect_to '/404'
    end
  end
end
