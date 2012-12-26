require 'test_helper'

class SearchTest < ActiveModel::TestCase
  include ActiveModel::Lint::Tests

  def setup
    @model = Search.new
  end

  def test_new_record
    assert @model.new_record?
  end

end
