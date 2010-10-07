require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @section = sections(:one)
    @certification = sections(:one).certification
  end

  test "should get index" do
    get :index, :certification_id => @certification.to_param 

    assert_equal assigns(:sections).size, @certification.sections.size

    assert_response :success
    assert_not_nil assigns(:sections)
    assert_not_nil assigns(:certification)
  end

  test "should get new" do
    get :new, :certification_id => @certification.to_param
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, :section => @section.attributes, :certification_id => @certification.to_param
    end

    assert_redirected_to certification_section_path(@certification,assigns(:section))
  end

  test "should show section" do
    get :show, :id => @section.to_param, :certification_id => @certification.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @section.to_param, :certification_id => @certification.to_param
    assert_response :success
  end

  test "should update section" do
    put :update, :id => @section.to_param, :section => @section.attributes, :certification_id => @certification.to_param
    assert_redirected_to certification_section_path(@certification,assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, :id => @section.to_param, :certification_id => @certification.to_param
    end

    assert_redirected_to certification_sections_path(@certification)
  end
end
