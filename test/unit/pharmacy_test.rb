require 'test_helper'

class PharmacyTest < ActiveSupport::TestCase
  test "relations" do
    assert_equal 1, pharmacies(:one).fulfillments.size
    assert_equal 2, pharmacies(:two).fulfillments.size
  end
end
