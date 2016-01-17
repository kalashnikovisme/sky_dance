class NewsController < ApplicationController
  def index
    @news = News.order(:published_at).page(params[:page])
  end

  def show
    @news = News.find(params[:id]).decorate
  end

  def new
    if admin_signed_in?
      @news = NewsForm.new_with_model
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @news = NewsForm.new_with_model
      if @news.submit params[:news]
        redirect_to @news, flash: :success
      else
        render action: :new
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @news = NewsForm.find_with_model params[:id]
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @news = NewsForm.find_with_model params[:id]
      if @news.submit params[:news]
        redirect_to @news, flash: :success
      else
        render action: :edit
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def destroy
    if admin_signed_in?
      @news = News.find params[:id]
      @news.destroy
      redirect_to news_index_path, flash: :success
    else
      redirect_to not_found_errors_path
    end
  end
end
