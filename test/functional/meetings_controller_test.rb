require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test "should get new" do
    get :new, :section_id => sections(:one).to_param
    assert_response :success
  end

  test "should create meeting without location" do
    assert_difference('Meeting.count') do
      post :create, :meeting => @meeting.attributes
    end

    assert_nil assigns(:location)

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should create meeting with new location " do
    assert_difference('Meeting.count') do
      post :create, :meeting => @meeting.attributes, :location => {:name => 'test', :lng => '1.235689', :lat => '45.568978'}
    end

    assert assigns(:location)
    assert_equal assigns(:meeting).location, assigns(:location)

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should create meeting with existing location" do
    assert_difference('Meeting.count') do
      post :create, :meeting => {:time => "2011-04-01 20:04:32", :description => 'test test', :section_id => 2, :location_id => 1}
    end

    assert_equal assigns(:meeting).location.id, meetings(:four).location_id

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should show meeting" do
    get :show, :id => @meeting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @meeting.to_param
    assert_response :success
  end

  test "should update meeting without location" do
    put :update, :id => @meeting.to_param, :meeting => @meeting.attributes
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should update meeting with new location" do
    put :update, :id => @meeting.to_param, :meeting => @meeting.attributes, :location => {:name => 'new location', :lat => 6, :lng => 7}
    assert assigns(:location)
    assert_equal assigns(:location), assigns(:meeting).location
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test "should destroy meeting" do
    section = @meeting.section

    assert_difference('Meeting.count', -1) do
      delete :destroy, :id => @meeting.to_param
    end

    assert_redirected_to certification_section_path(section.certification,section)
  end
end
