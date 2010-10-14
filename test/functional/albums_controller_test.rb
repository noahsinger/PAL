require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:albums)
  end

  test "as admin should get new" do
    login_as_admin

    get :new
    assert_response :success
  end

  test "as user should not get new" do
    get :new
    assert_redirected_to root_path
  end

  test "as admin should create album" do
    login_as_admin

    assert_difference('Album.count') do
      post :create, :album => @album.attributes
    end

    assert_redirected_to album_photos_path(assigns(:album))
  end

  test "as user should not create album" do
    post :create, :album => @album.attributes
    assert_redirected_to root_path
  end

  test "as admin should get edit" do
    login_as_admin
    
    get :edit, :id => @album.to_param
    assert_response :success
  end

  test "as user should not get edit" do
    get :edit, :id => @album.to_param
    assert_redirected_to root_path
  end

  test "as admin should update album" do
    login_as_admin

    put :update, :id => @album.to_param, :album => @album.attributes
    assert_redirected_to album_photos_path(assigns(:album))
  end

  test "as user should not update album" do
    put :update, :id => @album.to_param, :album => @album.attributes
    assert_redirected_to root_path
  end

  test "as admin should destroy album" do
    login_as_admin    

    assert_difference('Album.count', -1) do
      delete :destroy, :id => @album.to_param
    end

    assert_redirected_to albums_path
  end

  test "as user should not destroy album" do
    delete :destroy, :id => @album.to_param
    assert_redirected_to root_path
  end
end
