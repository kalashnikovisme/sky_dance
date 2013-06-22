class CategoriesController < ApplicationController

  def admins
    @category = Category.new
    @categories = Category.all
  end

  def create
    if admin_signed_in?
      @category = Category.new params[:category]
      if @category.save
        redirect_to admins_categories_path
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def edit
    if admin_signed_in?
      @category = Category.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @categories = Category.all
      @categories.each do |cat|
        if cat.update_attributes params[:category]
          redirect_to lessons_path
        else
          render action: "edit_all"
        end
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @category = Category.find params[:id]
      @category.destroy
      redirect_to admins_categories_path
    else
      redirect_to '/404'
    end
  end
end
