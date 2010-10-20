require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "admin should get index" do
    login_as_admin
    
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end
  
  test "user should not get index" do
    get :index
    assert_redirected_to root_path
  end

  test "admin should not get new" do
    login_as_admin
    
    get :new
    assert_redirected_to root_path
  end
  
  test "user should get new" do
    get :new
    assert_response :success
  end

  test "admin should not create contact" do
    login_as_admin
    
    post :create, :contact => @contact.attributes
    assert_redirected_to root_path
  end
  
  test "user should create contact" do
    assert_difference('Contact.count') do
      post :create, :contact => @contact.attributes
    end
    
    assert_redirected_to root_path
  end

  test "admin should show contact" do
    login_as_admin
    
    get :show, :id => @contact.to_param
    assert_response :success
  end
  
  test "user should not show contact" do
    get :show, :id => @contact.to_param
    assert_redirected_to root_path
  end

  test "admin should destroy contact" do
    login_as_admin
    
    assert_difference('Contact.count', -1) do
      delete :destroy, :id => @contact.to_param
    end

    assert_redirected_to contacts_path
  end
  
  test "user should not destroy contact" do
    delete :destroy, :id => @contact.to_param
    assert_redirected_to root_path
  end
end
