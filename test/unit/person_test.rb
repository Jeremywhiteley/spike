require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "rx associations" do
    assert_equal 2, people(:one).prescriptions_received.size
    assert_equal 2, people(:two).prescriptions_written.size
  end

  test "search" do
    assert_equal 2, Person.search(nil).length
    assert_equal 1, Person.search("One").length
    assert_equal 1, Person.search("Two").length
    assert_equal 2, Person.search("TestPatient").length
    assert_equal 1, Person.search("Main").length
  end

  test "advanced search" do
    assert_equal 1, Person.advanced_search(family: people(:one).family_name).length
    assert_equal 2, Person.advanced_search(given: people(:one).given_name).length
    assert_equal 1, Person.advanced_search(given: people(:one).given_name, family: people(:one).family_name).length
  end

  test "address associations" do
    assert_equal addresses(:one).street, people(:one).address.street
  end
end
