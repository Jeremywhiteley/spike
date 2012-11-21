require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "rx associations" do
    assert_equal 2, people(:one).prescriptions_received.size
    assert_equal 2, people(:two).prescriptions_written.size
  end
end
