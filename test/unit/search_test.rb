require 'test_helper'

class SearchTest < ActiveModel::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = Search.new
  end

  def test_new_record
    assert @model.new_record?
  end

  def test_not_provided
    assert !@model.attributes_provided?
  end

  def test_provided
    @model = Search.new family: "foo"
    assert @model.attributes_provided?
    assert_equal "foo", @model.family
  end

end
