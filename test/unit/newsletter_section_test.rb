require 'test_helper'

class NewsletterSectionTest < ActiveSupport::TestCase
  test "should exist" do
    assert_equal 3, NewsletterSection.count
  end
  
  test "should belong to a newsletter" do
    @section = NewsletterSection.first
    assert_not_nil @section.newsletter
  end
end
