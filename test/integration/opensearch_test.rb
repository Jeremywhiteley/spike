require 'test_helper'

class OpenSearchTest < ActionDispatch::IntegrationTest

  test "fetch description doc" do
    sign_in

    # get the root page (any HTML page will do) to get the description
    # document link in the header
    get "/"
    root = Nokogiri::HTML response.body
    desc_doc_link = root.xpath("/html/head/link[@type=\"application/opensearchdescription+xml\"]")[0]
    assert_equal "search", desc_doc_link.xpath("@rel")[0].value

    # get the opensearch description document
    get desc_doc_link.xpath("@href")[0].value
    assert_response :success
  end

end
