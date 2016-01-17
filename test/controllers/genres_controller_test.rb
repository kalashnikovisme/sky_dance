require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  setup do
    @genre = create :genre
    @admin = create :admin
  end

  test 'should get new genre' do
    admin_sign_in @admin

    get :new
    assert_response :success
  end

  test "should not get new genre" do
    get :new
    assert_redirected_to not_found_errors_path
  end

  test 'should create genre' do
    admin_sign_in @admin

    attributes = attributes_for :genre
    post :create, genre: attributes
    assert_response :redirect

    genre = Genre.last
    assert_equal attributes[:description], genre.description
  end

  test 'should not create genre without no access' do
    attributes = attributes_for :genre
    post :create, genre: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should get genres index" do
    get :index
    assert_response :success
    assert_not_nil assigns :genres
  end

  test "should show genre" do
    get :show, id: @genre
    assert_response :success
  end

  test "should get edit"  do
    admin_sign_in @admin

    get :edit, id: @genre
    assert_response :success
  end

  test "should not edit with no access" do
    get :edit, id: @genre
    assert_redirected_to not_found_errors_path
  end

  test "should update genre" do
    admin_sign_in @admin

    attributes = attributes_for :genre
    put :update, id: @genre, genre: attributes
    assert_response :redirect

    @genre.reload
    assert_equal attributes[:title], @genre.title
  end

  test "should not update genre with no access" do
    attributes = attributes_for :genre
    put :update, id: @genre, genre: attributes
    assert_redirected_to not_found_errors_path
  end

  test "should destroy genre" do
    admin_sign_in @admin

    assert_difference('Genre.count', -1) do
      delete :destroy, id: @genre
    end

    assert_redirected_to genres_path
  end

  test "should not destroy genre" do
    assert_difference('Genre.count', 0) do
      delete :destroy, id: @genre
    end
    assert_redirected_to not_found_errors_path
  end
end
