require 'test_helper'

class CertificationTest < ActiveSupport::TestCase
  test "that there are sections" do
    assert_kind_of Array, certifications(:one).sections
  end

  test "certifications have a level" do
    assert certifications(:one).certification_level
  end
end
