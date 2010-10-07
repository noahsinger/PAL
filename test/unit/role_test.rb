require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "should have users" do
    assert_equal 2, roles(:one).users.size
  end
end
