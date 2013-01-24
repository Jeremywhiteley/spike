require 'test_helper'

class PrescriptionTest < ActiveSupport::TestCase
  test "relations" do
    assert_equal 1, prescriptions(:one).fulfillments.size
    assert_equal 2, prescriptions(:two).fulfillments.size
  end
end
