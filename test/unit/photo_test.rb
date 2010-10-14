require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should exist" do
    assert_equal 5, Photo.count
  end

  test "should belong to an album" do
    assert_not_nil Photo.first.album
  end
end
