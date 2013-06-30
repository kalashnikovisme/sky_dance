class CategoriesController < ApplicationController

  def admins
    if admin_signed_in?
      @categories = Category.all
      @category = Category.new
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @category = Category.new params[:category]
      if @category.save
        redirect_to new_group_path
      else
        render action: 'new'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @category = Category.find params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @category = Category.find params[:id]
      if @category.update_attributes params[:category]
        redirect_to schedule_path
      else
        render action: "edit"
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @category = Category.find params[:id]
      @category.destroy
      redirect_to admins_categories_path
    else
      redirect_to not_found_errors_path
    end
  end
end
