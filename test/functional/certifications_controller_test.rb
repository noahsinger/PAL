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

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certification" do
    assert_difference('Certification.count') do
      post :create, :certification => {:name => "Sample 3", :description => "This is the description", :certification_level_id => 1}
    end

    assert_redirected_to certification_sections_path(assigns(:certification))
  end

  test "should get edit" do
    get :edit, :id => @certification.to_param
    assert_response :success
  end

  test "should update certification" do
    put :update, :id => @certification.to_param, :certification => @certification.attributes
    assert_redirected_to certification_sections_path(assigns(:certification))
  end

  test "should destroy certification" do
    assert_difference('Certification.count', -1) do
      delete :destroy, :id => @certification.to_param
    end

    assert_redirected_to certifications_path
  end
end
