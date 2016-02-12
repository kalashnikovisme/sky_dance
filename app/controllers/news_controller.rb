class NewsController < ApplicationController
  before_filter :format_published_at, only: [ :create, :update ]

  def index
    @news = News.order('published_at desc').page params[:page]
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

  private

  def format_published_at
    params[:news][:published_at] ||= DateTime.new params[:news]['published_at(1i)'].to_i,
    				    params[:news]['published_at(2i)'].to_i,
    				    params[:news]['published_at(3i)'].to_i
  end
end
