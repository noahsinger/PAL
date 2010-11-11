require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  test "should exist" do
    assert_equal 2, Newsletter.count
  end
  
  test "should have sections" do
    @newsletter = Newsletter.find 1
    assert_equal 3, @newsletter.newsletter_sections.count
  end
end
