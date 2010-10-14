require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @role = roles(:one)
  end

  test "as admin should get index" do
    login_as_admin

    get :index
    assert_response :success
    assert_not_nil assigns(:roles)
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

  test "as admin should create role" do
    login_as_admin

    assert_difference('Role.count') do
      post :create, :role => @role.attributes
    end

    assert_redirected_to role_path(assigns(:role))
  end

  test "as user should not create role" do
    post :create, :role => @role.attributes
    assert_redirected_to root_path
  end

  test "as admin should show role" do
    login_as_admin

    get :show, :id => @role.to_param
    assert_response :success
  end

  test "as user should not show role" do
    get :show, :id => @role.to_param
    assert_redirected_to root_path
  end

  test "as admin should get edit" do
    login_as_admin

    get :edit, :id => @role.to_param
    assert_response :success
  end

  test "as user should not get edit" do
    get :edit, :id => @role.to_param
    assert_redirected_to root_path
  end

  test "as admin should update role" do
    login_as_admin

    put :update, :id => @role.to_param, :role => @role.attributes
    assert_redirected_to role_path(assigns(:role))
  end

  test "as user should not update role" do
    put :update, :id => @role.to_param, :role => @role.attributes
    assert_redirected_to root_path
  end

  test "as admin should destroy role" do
    login_as_admin
    
    assert_difference('Role.count', -1) do
      delete :destroy, :id => @role.to_param
    end

    assert_redirected_to roles_path
  end

  test "as user should not destroy role" do
    delete :destroy, :id => @role.to_param
    assert_redirected_to root_path
  end
end
