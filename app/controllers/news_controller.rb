class NewsController < ApplicationController
  def index
    @news = News.all
  end

  def show
    @news = News.find params[:id]
  end

  def new
    if admin_signed_in?
      @news = News.new
    else
      redirect_to '/404'
    end
  end

  def create
    if admin_signed_in?
      @news = News.new params[:news]
      if @news.save
        redirect_to @news
      else
        render action: 'new'
      end
    else
      redirect_to '/404'
    end
  end

  def edit
    if admin_signed_in?
      @news = News.find params[:id]
    else
      redirect_to '/404'
    end
  end

  def update
    if admin_signed_in?
      @news = News.find params[:id]
      if @news.update_attributes params[:news]
        redirect_to @news
      else
        render action: edit
      end
    else
      redirect_to '/404'
    end
  end

  def destroy
    if admin_signed_in?
      @news = News.find params[:id]
      @news.destroy
      redirect_to news_index_path
    else
      redirect_to '/404'
    end
  end
end
