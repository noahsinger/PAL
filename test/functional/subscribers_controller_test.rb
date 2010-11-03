require 'test_helper'

class SubscribersControllerTest < ActionController::TestCase
  setup do
    @subscriber = subscribers(:one)
  end

  test "admin should get index" do
    login_as_admin
    
    get :index
    assert_response :success
    assert_not_nil assigns(:subscribers)
  end
  
  test "user should get not index" do
    get :index
    assert_redirected_to root_path
  end

  test "should create subscriber" do
    assert_difference('Subscriber.count') do
      post :create, :subscriber => {:email => 'testperson3@testperson.com'}
    end

    assert_redirected_to root_path
  end

  test "admin should destroy subscriber" do
    login_as_admin
    
    assert_difference('Subscriber.count', -1) do
      delete :destroy, :id => @subscriber.to_param
    end

    assert_redirected_to subscribers_path
  end
  
  test "user should destroy not subscriber" do
    delete :destroy, :id => @subscriber.to_param
    assert_redirected_to root_path
  end
end
