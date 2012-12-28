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

    # make a query and check results
    get searches_path + "?family=#{people(:one).family_name}&given=#{people(:one).given_name}", {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success
    results = Nokogiri::XML response.body
    # ensure correct number of people
    assert_equal "1", results.xpath("/xmlns:feed/opensearch:totalResults/text()").text
    # ensure correct patientInformation
    assert_equal people(:one).family_name, results.xpath("//c32:patientInformation/c32:name/c32:familyName/text()", "c32" => "urn:hl7-org:greencda:c32").text
    assert_equal people(:one).address.street, results.xpath("//c32:patientInformation/c32:address/c32:street/text()", "c32" => "urn:hl7-org:greencda:c32").text
  end

end
