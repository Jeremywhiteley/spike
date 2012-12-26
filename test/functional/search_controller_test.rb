require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get opensearch description document" do
    request.env["HTTP_ACCEPT"] = "application/opensearchdescription+xml"
    get :description
    assert_response :success
    assert_match "application/opensearchdescription+xml", response.headers['Content-Type']

    # I'd like to validate the response against an OpenSearch XML
    # schema, but there doesn't seem to be such a beast
    desc_doc = Hash.from_xml response.body
    assert_equal "PDMP Patient Search", desc_doc["OpenSearchDescription"]["ShortName"]
  end

end
