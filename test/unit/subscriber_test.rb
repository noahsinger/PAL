require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  test "subscribers exist" do
    assert_equal 2, Subscriber.count
  end
  
  test "subscriber code" do
    s = Subscriber.new :email => 'test@test.com'
    s.save
    
    assert_equal Digest::SHA256.hexdigest("subscriber#{s.id}#{s.email}"), s.code
  end
end
