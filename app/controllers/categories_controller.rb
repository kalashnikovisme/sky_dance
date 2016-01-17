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
      @category = CategoryForm.new_with_model
      if @category.submit params[:category]
        redirect_to new_group_path, flash: :success
      else
        render action: :new
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @category = CategoryForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @category = CategoryForm.find_with_model params[:id]
      if @category.submit params[:category]
        redirect_to schedule_path, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @category = Category.find params[:id]
      @category.destroy
      redirect_to admins_categories_path, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
