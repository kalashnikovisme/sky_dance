require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  setup do
    @admin = create :admin
    @news  = create :news
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @news
    assert_response :success
  end

  test "should get new" do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test "should not get new" do
    get :new
    assert_redirected_to not_found_errors_path
  end

  test "should create" do
    admin_sign_in @admin

    attributes = attributes_for :news
    post :create, news: attributes
    assert_response :redirect

    news = News.last
    assert_equal attributes[:title], news.title
  end

  test "should not create" do
    attributes = attributes_for :news
    post :create, news: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should get edit" do
    admin_sign_in @admin

    get :edit, id: @news
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: @news
    assert_redirected_to not_found_errors_path
  end

  test "should update news" do
    admin_sign_in @admin

    attributes = attributes_for :news
    post :update, id: @news, news: attributes
    assert_response :redirect

    @news.reload
    assert_equal attributes[:title], @news.title
  end

  test "should not update news" do
    attributes = attributes_for :news
    post :update, id: @news, news: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should destroy" do
    admin_sign_in @admin

    assert_difference('News.count', -1) do
      delete :destroy, id: @news
    end

    assert_redirected_to news_index_path
  end

  test "should not destroy" do
    assert_difference('News.count', 0) do
      delete :destroy, id: @news
    end
    assert_redirected_to not_found_errors_path
  end
end
