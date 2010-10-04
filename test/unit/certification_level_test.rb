require 'test_helper'

class CertificationLevelTest < ActiveSupport::TestCase
  test "levels have certifications" do
    assert_equal 1, certification_levels(:one).certifications.count
  end
end
