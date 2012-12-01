# helpful methods and assertions for atom feed testing
class AtomTestCase < ActionController::TestCase
  def assert_atom_success
    assert_response :success
    assert_equal "application/atom+xml", response.content_type
  end

  def atom_results
    Feedzirra::Feed.parse(@response.body)
  end

  def assert_atom_result_count rss, count
    assert_not_nil(rss.entries)
    assert_equal(count, rss.entries.size)
  end

end
