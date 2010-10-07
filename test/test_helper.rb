ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "authlogic/test_case"
require "declarative_authorization/maintenance"

class ActiveSupport::TestCase
  include Authorization::TestHelper
  include Authorization::Maintenance
  
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as_admin
    old_controller = @controller
    @controller = UserSessionsController.new
    post :create, :user_session => {:username => 'admin_user', :password => 'password'}
    @controller = old_controller
    User.where( :username => 'admin_user' ).first
  end

  def login_as_user
    old_controller = @controller
    @controller = UserSessionsController.new
    post :create, :user_session => {:username => 'normal_user', :password => 'mypassword'}
    @controller = old_controller
    User.where( :username => 'normal_user' ).first
  end
  
  def logout
    old_controller = @controller
    @controller = UserSessionsController.new
    delete :destroy
    @controller = old_controller    
  end
  
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
end
