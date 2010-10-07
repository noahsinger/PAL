require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should have roles" do
    assert_equal 1, users(:one).roles.size
    assert_equal "admin", users(:one).roles.first.name
  end
end
