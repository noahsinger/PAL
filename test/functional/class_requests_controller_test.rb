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
    get :new, :certification_id => @class_request.certification.id
    assert_response :success
  end

  test "should create class_request" do
    assert_difference('ClassRequest.count') do
      post :create, :class_request => @class_request.attributes
    end

    assert_redirected_to certification_sections_path(:certification_id => @class_request.certification.id)
  end

  test "should show class_request" do
    get :show, :id => @class_request.to_param
    assert_response :success
  end

  test "should destroy class_request" do
    assert_difference('ClassRequest.count', -1) do
      delete :destroy, :id => @class_request.to_param
    end

    assert_redirected_to class_requests_path
  end
end
