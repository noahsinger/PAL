require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  test "belongs to a certification" do
    assert_kind_of Certification, sections(:one).certification
  end

  test "sections should have meetings" do
    assert_equal 2, sections(:one).meetings.count
  end
end
