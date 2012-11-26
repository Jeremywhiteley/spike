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
    assert_equal 2, Person.search("MyString").length
  end
end
