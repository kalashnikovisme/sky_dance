require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  setup do
    @genre = create :genre
    @admin = create :admin
  end

  test 'should create genre' do
    admin_sign_in(@admin)

    attributes = attributes_for :genre
    post :create, genre: attributes
    assert_response :redirect

    genre = Genre.last
    assert_equal attributes[:description], genre.description
  end

  test 'should not create genre without no access' do
    attributes = attributes_for :genre
    post :create, genre: attributes
    assert_redirected_to '/404'
  end
end
