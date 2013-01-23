require 'test_helper'

class HdataFetchTest < ActionDispatch::IntegrationTest

  test "fetch hdata" do
    sign_in

    # get people atom feed
    get "/people", {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # follow it to person one's Atom feed
    index_feed = Hash.from_xml response.body
    assert_equal 3, index_feed["feed"]["entry"].size
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
    srpp_feed = Hash.from_xml response.body
    assert_equal Array, srpp_feed["feed"]["entry"].class
    ccda_doc = srpp_feed["feed"]["entry"].select{|h|h["title"].match "report"}[0]["link"].select{|h|h["type"]=="application/xml"}[0]["href"]
    get ccda_doc, {}, "HTTP_ACCEPT" => 'application/xml'
    assert_response :success

    # check full report
    ccda_data = Hash.from_xml response.body
    assert_equal people(:one).family_name, ccda_data["record"]["patientInformation"]["name"]["familyName"]

    # get demographic document
    demographic_doc = srpp_feed["feed"]["entry"].select{|h|h["title"].match "demographic"}[0]["link"].select{|h|h["type"]=="application/xml"}[0]["href"]
    get demographic_doc, {}, "HTTP_ACCEPT" => 'application/xml'
    assert_response :success

    # check demographic document
    demographic_data = Hash.from_xml response.body
    assert_equal people(:one).family_name, demographic_data["record"]["patientInformation"]["name"]["familyName"]

  end

end
