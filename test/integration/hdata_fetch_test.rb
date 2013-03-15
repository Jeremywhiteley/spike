require 'test_helper'

class HdataFetchTest < ActionDispatch::IntegrationTest

  test "fetch hdata" do
    sign_in

    # get people atom feed
    get "/people", {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # follow it to person one's Atom feed
    index_feed = Hash.from_xml response.body
    assert_equal 4, index_feed["feed"]["entry"].size
    person_path = index_feed["feed"]["entry"].select{|h|h["title"]=="Mr TestPatient One"}[0]["link"].select{|h|h["type"]=="application/atom+xml"}[0]["href"]
    get person_path, {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # process person one's Atom feed
    person_feed = Hash.from_xml response.body
    assert_equal Hash, person_feed["feed"]["entry"].class

    # get srpp feed
    srpp_path = person_feed["feed"]["entry"]["link"].select{|h|h["type"]=="application/atom+xml"}[0]["href"]
    get srpp_path, {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # get full report
    srpp_feed = Nokogiri::XML response.body
    assert_equal 4, srpp_feed.xpath("/xmlns:feed/xmlns:entry").length
    ccda_doc = srpp_feed.xpath("/xmlns:feed/xmlns:entry/xmlns:link[@rel=\"report\" and @type=\"application/vnd.mitre.pdmp.2+xml\"]/@href").text
    get ccda_doc, {}, "HTTP_ACCEPT" => 'application/vnd.mitre.pdmp.2+xml'
    assert_response :success

    # check full report
    ccda_data = Hash.from_xml response.body
    assert_equal people(:one).family_name, ccda_data["record"]["patientInformation"]["name"]["familyName"]

    # get demographic document
    demographic_doc = srpp_feed.xpath("/xmlns:feed/xmlns:entry/xmlns:link[@rel=\"demo\" and @type=\"application/vnd.mitre.pdmp.2+xml\"]/@href").text
    get demographic_doc, {}, "HTTP_ACCEPT" => 'application/vnd.mitre.pdmp.2+xml'
    assert_response :success

    # check demographic document
    demographic_data = Hash.from_xml response.body
    assert_equal people(:one).family_name, demographic_data["patientInformation"]["name"]["familyName"]

  end

end
