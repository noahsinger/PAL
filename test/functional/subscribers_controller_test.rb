require 'test_helper'

class SubscribersControllerTest < ActionController::TestCase
  setup do
    @subscriber1 = subscribers(:one)
    # @subscriber2 = subscribers(:two)
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
  
  test "should be able to verify a subscriber" do
    puts "\n-----------------------------------------------------------------------------"
    # puts "id is:     '#{subscribers(:two).id}'"
    puts "should be: '#{Digest::SHA256.hexdigest("subscriber2testperson2@person.com")}'"
    # puts "code is:   '#{subscribers(:two).code}'"
    puts "-----------------------------------------------------------------------------"
    
    get :verify, :id => 2, :code => Digest::SHA256.hexdigest("subscriber2testperson2@person.com")  #works only if subscribers(:two) has not been accessed in any way
    # get :verify, :id => subscribers(:two).id, :code => Digest::SHA256.hexdigest("subscriber2testperson2@person.com")  #doesn't work
    # get :verify, :id => subscribers(:two).id, :code => subscribers(:two).code  #doesn't work
    
    assert_equal true, subscribers(:two).verified
    assert_redirected_to root_path
  end

  test "admin should destroy subscriber" do
    login_as_admin
    
    assert_difference('Subscriber.count', -1) do
      delete :destroy, :id => @subscriber1.to_param
    end

    assert_redirected_to subscribers_path
  end
  
  test "user should destroy not subscriber" do
    delete :destroy, :id => @subscriber1.to_param
    assert_redirected_to root_path
  end
end
