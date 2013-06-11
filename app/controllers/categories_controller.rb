class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    if admin_signed_in?
      @category = Category.new params[:category]
      if @category.save
        redirect_to schedule_path
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

end
