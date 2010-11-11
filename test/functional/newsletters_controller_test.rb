require 'test_helper'

class NewslettersControllerTest < ActionController::TestCase
  setup do
    @newsletter = newsletters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:newsletters)
  end

  test "admin should create newsletter" do
    login_as_admin
    
    assert_difference('Newsletter.count') do
      post :create, :newsletter => @newsletter.attributes
    end

    assert_redirected_to newsletter_path(assigns(:newsletter))
  end
  
  test "user should not create newsletter" do
    post :create, :newsletter => @newsletter.attributes
    assert_redirected_to root_path
  end

  test "admin should show newsletter" do
    login_as_admin
    
    get :show, :id => @newsletter.to_param
    assert_response :success
  end
  
  test "user should not show newsletter" do
    get :show, :id => @newsletter.to_param
    assert_redirected_to root_path
  end
  
  test "should view newsletter" do
    get :view, :id => @newsletter.to_param
    assert_response :success
  end

  test "admin should destroy newsletter" do
    login_as_admin
    
    assert_difference('Newsletter.count', -1) do
      delete :destroy, :id => @newsletter.to_param
    end

    assert_redirected_to newsletters_path
  end
  
  test "user should not destroy newsletter" do
    delete :destroy, :id => @newsletter.to_param
    assert_redirected_to root_path
  end
end
