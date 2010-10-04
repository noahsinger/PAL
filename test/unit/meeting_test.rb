require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test "meetings are for sections" do
    assert meetings(:one).section
  end
end
