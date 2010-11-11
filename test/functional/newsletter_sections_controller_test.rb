require 'test_helper'

class NewsletterSectionsControllerTest < ActionController::TestCase
  setup do
    @newsletter_section = newsletter_sections(:one)
    @newsletter = @newsletter_section.newsletter
  end

  test "admin should get reorder" do
    login_as_admin
    
    get :reorder, :newsletter_id => 1
    assert_response :success
  end
  
  test "user should not get reorder" do
    get :reorder, :newsletter_id => 1
    assert_redirected_to root_path
  end

  test "admin should get new" do
    login_as_admin
    
    get :new, :newsletter_id => 1
    assert_response :success
  end
  
  test "user should not get new" do
    get :new, :newsletter_id => 1
    assert_redirected_to root_path
  end

  test "admin should create newsletter_section" do
    login_as_admin
    
    assert_difference('NewsletterSection.count') do
      post :create, :newsletter_id => 1, :newsletter_section => @newsletter_section.attributes
    end

    assert_redirected_to newsletter_path(assigns(:newsletter_section).newsletter)
  end
  
  test "user should not create newsletter_section" do
    post :create, :newsletter_id => 1, :newsletter_section => @newsletter_section.attributes
    assert_redirected_to root_path
  end

  test "admin should get edit" do
    login_as_admin
    
    get :edit, :newsletter_id => 1, :id => @newsletter_section.to_param
    assert_response :success
  end
  
  test "user should not get edit" do
    get :edit, :newsletter_id => 1, :id => @newsletter_section.to_param
    assert_redirected_to root_path
  end

  test "admin should update newsletter_section" do
    login_as_admin
    
    put :update, :newsletter_id => 1, :id => @newsletter_section.to_param, :newsletter_section => @newsletter_section.attributes
    assert_redirected_to newsletter_path(assigns(:newsletter_section).newsletter)
  end
  
  test "user should not update newsletter_section" do
    put :update, :newsletter_id => 1, :id => @newsletter_section.to_param, :newsletter_section => @newsletter_section.attributes
    assert_redirected_to root_path
  end

  test "admin should destroy newsletter_section" do
    login_as_admin
    
    assert_difference('NewsletterSection.count', -1) do
      delete :destroy, :newsletter_id => 1, :id => @newsletter_section.to_param
    end

    assert_redirected_to newsletter_path(@newsletter)
  end
  
  test "user should not destroy newsletter_section" do
    delete :destroy, :newsletter_id => 1, :id => @newsletter_section.to_param
    assert_redirected_to root_path
  end
end
