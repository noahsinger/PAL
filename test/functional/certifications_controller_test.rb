require 'test_helper'

class CertificationsControllerTest < ActionController::TestCase
  setup do
    @certification = certifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certifications)
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

  test "as admin should create certification" do
    login_as_admin
    
    assert_difference('Certification.count') do
      post :create, :certification => {:name => "Sample 3", :description => "This is the description", :certification_level_id => 1}
    end

    assert_redirected_to certification_sections_path(assigns(:certification))
  end

  test "as user should not create certification" do
    post :create, :certification => {:name => "Sample 3", :description => "This is the description", :certification_level_id => 1}
    assert_redirected_to root_path
  end

  test "as admin should get edit" do
    login_as_admin
    
    get :edit, :id => @certification.to_param
    assert_response :success
  end

  test "as user should not get edit" do
    get :edit, :id => @certification.to_param
    assert_redirected_to root_path
  end

  test "as admin should update certification" do
    login_as_admin
    
    put :update, :id => @certification.to_param, :certification => @certification.attributes
    assert_redirected_to certification_sections_path(assigns(:certification))
  end

  test "as user should not update certification" do
    put :update, :id => @certification.to_param, :certification => @certification.attributes
    assert_redirected_to root_path
  end

  test "as admin should destroy certification" do
    login_as_admin
    
    assert_difference('Certification.count', -1) do
      delete :destroy, :id => @certification.to_param
    end

    assert_redirected_to certifications_path
  end

  test "as user should not destroy certification" do
    delete :destroy, :id => @certification.to_param
    assert_redirected_to root_path
  end
end
