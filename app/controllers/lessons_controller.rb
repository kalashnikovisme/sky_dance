class LessonsController < ApplicationController

  def index
    @genres = Genre.all
    @lessons = Lesson.all
    #FIXME
    @days = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  end

  def new
    @lesson = Lesson.new
  end

  def create(group_id)
    if admin_signed_in?
      params[:group_id] = group_id
      @lesson = Lesson.new params[:lesson]
      if @lesson.save
        redirect_to lessons_path
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def edit
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      if @lesson.update_attributes params[:lesson]
        redirect_to lessons_path
      else
        render action: 'edit'
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @lesson = Lesson.find params[:id]
      @lesson.destroy
      redirect_to lessons_path
    else
      redirect_to '/404'
    end
  end
end
