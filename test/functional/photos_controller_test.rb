require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = photos(:one)
    @album = @photo.album
  end

  test "should get index" do
    get :index, :album_id => @album.to_param
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "as admin should get new" do
    login_as_admin
    
    get :new, :album_id => @album.to_param
    assert_response :success
  end

  test "as admin should create photo" do
    login_as_admin
    
    assert_difference('Photo.count') do
      # post :create, :photo => @photo.attributes, :album_id => @album.to_param
      post :create, :photo => {:title => 'test photo', :description => 'test', :image => fixture_file_upload("images/flower1.jpg", "image/jpeg")}, :album_id => @album.to_param
    end

    assert_redirected_to album_photo_path(@album,assigns(:photo))
  end

  test "as admin should show photo" do
    login_as_admin
    
    get :show, :id => @photo.to_param, :album_id => @album.to_param
    assert_response :success
  end

  test "as admin should get edit" do
    login_as_admin
    
    get :edit, :id => @photo.to_param, :album_id => @album.to_param
    assert_response :success
  end

  test "as admin should update photo" do
    login_as_admin
    put :update, :id => @photo.to_param, :photo => @photo.attributes, :album_id => @album.to_param
    assert_redirected_to album_photo_path(@album,assigns(:photo))
  end

  test "as admin should destroy photo" do
    login_as_admin
    assert_difference('Photo.count', -1) do
      delete :destroy, :id => @photo.to_param, :album_id => @album.to_param
    end

    assert_redirected_to album_photos_path(@album)
  end
end
