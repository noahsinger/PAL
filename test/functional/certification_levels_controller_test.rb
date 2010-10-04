require 'test_helper'

class CertificationLevelsControllerTest < ActionController::TestCase
  setup do
    @certification_level = certification_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:certification_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create certification_level" do
    assert_difference('CertificationLevel.count') do
      post :create, :certification_level => {:name => 'Pro'}
    end

    assert_redirected_to certification_level_path(assigns(:certification_level))
  end

  test "should show certification_level" do
    get :show, :id => @certification_level.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @certification_level.to_param
    assert_response :success
  end

  test "should update certification_level" do
    put :update, :id => @certification_level.to_param, :certification_level => @certification_level.attributes
    assert_redirected_to certification_level_path(assigns(:certification_level))
  end

  test "should destroy certification_level" do
    assert_difference('CertificationLevel.count', -1) do
      delete :destroy, :id => @certification_level.to_param
    end

    assert_redirected_to certification_levels_path
  end
end
