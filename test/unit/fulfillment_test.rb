require 'test_helper'

class FulfillmentTest < ActiveSupport::TestCase
  test "relations" do
    assert_equal prescriptions(:two), fulfillments(:two).prescription
    assert_equal pharmacies(:one), fulfillments(:one).pharmacy
    assert_equal people(:four), fulfillments(:three).pharmacist
  end
end
