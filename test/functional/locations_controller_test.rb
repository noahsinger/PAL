require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "as admin should get index" do
    login_as_admin

    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "as user should not get index" do
    get :index
    assert_redirected_to root_path
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

  test "as admin should create location" do
    login_as_admin

    assert_difference('Location.count') do
      post :create, :location => {:name => 'location 3', :lng => 3, :lat => 2}
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "as user should not create location" do
    post :create, :location => {:name => 'location 3', :lng => 3, :lat => 2}
    assert_redirected_to root_path
  end

  test "as admin should show location" do
    login_as_admin

    get :show, :id => @location.to_param
    assert_response :success
  end

  test "as user should not show location" do
    get :show, :id => @location.to_param
    assert_redirected_to root_path
  end

  test "as admin should get edit" do
    login_as_admin

    get :edit, :id => @location.to_param
    assert_response :success
  end

  test "as user should not get edit" do
    get :edit, :id => @location.to_param
    assert_redirected_to root_path
  end

  test "as admin should update location" do
    login_as_admin

    put :update, :id => @location.to_param, :location => @location.attributes
    assert_redirected_to location_path(assigns(:location))
  end

  test "as user should not update location" do
    put :update, :id => @location.to_param, :location => @location.attributes
    assert_redirected_to root_path
  end

  test "as admin should destroy location" do
    login_as_admin

    assert_difference('Location.count', -1) do
      delete :destroy, :id => @location.to_param
    end

    assert_redirected_to locations_path
  end

  test "as user should not destroy location" do
    delete :destroy, :id => @location.to_param
    assert_redirected_to root_path
  end
end
