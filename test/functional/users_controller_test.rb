require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "as admin should get index" do
    login_as_admin

    get :index
    assert_response :success
    assert_not_nil assigns(:users)
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

  test "as admin should create user" do
    login_as_admin

    assert_difference('User.count') do
      post :create, :user => {:username => 'new_user', :password => 'test', :password_confirmation => 'test'}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "as user should not create user" do
    post :create, :user => {:username => 'new_user', :password => 'test', :password_confirmation => 'test'}
    assert_redirected_to root_path
  end

  test "as admin should show user" do
    login_as_admin

    get :show, :id => @user.to_param
    assert_response :success
  end

  test "as user should not show user" do
    get :show, :id => @user.to_param
    assert_redirected_to root_path
  end

  test "as admin should get edit" do
    login_as_admin

    get :edit, :id => @user.to_param
    assert_response :success
  end

  test "as user should not get edit" do
    get :edit, :id => @user.to_param
    assert_redirected_to root_path
  end

  test "as admin should update user" do
    login_as_admin

    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "as user should not update user" do
    put :update, :id => @user.to_param, :user => @user.attributes
    assert_redirected_to root_path
  end

  test "as admin should destroy user" do
    login_as_admin

    assert_difference('User.count', -1) do
      delete :destroy, :id => @user.to_param
    end

    assert_redirected_to users_path
  end

  test "as user should not destroy user" do
    delete :destroy, :id => @user.to_param
    assert_redirected_to root_path
  end
end
