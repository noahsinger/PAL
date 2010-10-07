require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  # access the login page
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be able to login" do
    # skip("Not even sure that this will ever work or should")
    post :create, :user_session => {:username => 'admin_user', :password => "password"}
    assert_redirected_to root_path
  end

  test "should be able to logout" do
    login_as_admin
    delete :destroy
    assert_redirected_to root_path
  end
end
