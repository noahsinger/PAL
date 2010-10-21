require 'test_helper'

class ClassRequestsControllerTest < ActionController::TestCase
  setup do
    @class_request = class_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:class_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create class_request" do
    assert_difference('ClassRequest.count') do
      post :create, :class_request => @class_request.attributes
    end

    assert_redirected_to class_request_path(assigns(:class_request))
  end

  test "should show class_request" do
    get :show, :id => @class_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @class_request.to_param
    assert_response :success
  end

  test "should update class_request" do
    put :update, :id => @class_request.to_param, :class_request => @class_request.attributes
    assert_redirected_to class_request_path(assigns(:class_request))
  end

  test "should destroy class_request" do
    assert_difference('ClassRequest.count', -1) do
      delete :destroy, :id => @class_request.to_param
    end

    assert_redirected_to class_requests_path
  end
end
