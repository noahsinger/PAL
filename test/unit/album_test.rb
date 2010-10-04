require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "should exist" do
    assert_equal 2, Album.count
  end

  test "should have photos" do
    assert_equal 3, Album.find(1).photos.count
  end
end
