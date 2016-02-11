class Admin::PagesController < Admin::ApplicationController
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = PageForm.new_with_model
    if @page.submit params[:page]
      redirect_to page_path(@page.slug), flash: :success
    else
      render action: :new
    end
  end

  def edit
    @page = PageForm.find_with_model params[:id]
  end

  def update
    @page = PageForm.find_with_model params[:id]
    if @page.submit params[:page]
      redirect_to page_path(@page.slug), flash: :success
    else
      render action: :edit
    end
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to admin_path, flash: :success
  end
end
