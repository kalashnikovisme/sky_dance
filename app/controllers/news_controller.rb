class NewsController < ApplicationController
  def index
    @news = News.order(:published_at).page(params[:page]).per 1
  end

  def show
    @news = News.find(params[:id]).decorate
  end

  def new
    if admin_signed_in?
      @news = News.new.decorate
    else
      redirect_to not_found_errors_path
    end
  end

  def create
    if admin_signed_in?
      @news = News.new params[:news]
      if @news.save
        redirect_to @news, flash: :success
      else
        render action: 'new'
      end
    else
      redirect_to not_found_errors_path
    end
  end

  def edit
    if admin_signed_in?
      @news = News.find(params[:id]).decorate
    else
      redirect_to not_found_errors_path
    end
  end

  def update
    if admin_signed_in?
      @news = News.find params[:id]
      if @news.update_attributes params[:news]
        redirect_to @news, flash: :success
      else
        render action: edit
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
