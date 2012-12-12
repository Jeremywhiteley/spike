require 'test_helper'

class HdataFetchTest < ActionDispatch::IntegrationTest

  test "fetch hdata" do
    sign_in

    # get people atom feed
    get "/people", {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # follow it to person one's Atom feed
    index_feed = Hash.from_xml response.body
    assert_equal 2, index_feed["feed"]["entry"].size
    person_path = index_feed["feed"]["entry"].select{|h|h["title"]=="MyString One"}[0]["link"].select{|h|h["type"]=="application/atom+xml"}[0]["href"]
    get person_path, {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # process person's Atom feed, get demographics
    person_feed = Hash.from_xml response.body
    assert_equal 3, person_feed["feed"]["entry"].size
    demographic_path = person_feed["feed"]["entry"].select{|h|h["id"]=="/demographic"}[0]["link"].select{|h|h["type"]=="application/atom+xml"}[0]["href"]
    get demographic_path, {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # process demographic feed
    demographic_feed = Hash.from_xml response.body
    assert_equal Hash, demographic_feed["feed"]["entry"].class
    demographic_doc = demographic_feed["feed"]["entry"]["link"].select{|h|h["type"]=="application/xml"}[0]["href"]
    get demographic_doc, {}, "HTTP_ACCEPT" => 'application/xml'
    assert_response :success

    # process demographic document
    demographic_data = Hash.from_xml response.body
    assert_equal people(:one).name, demographic_data["record"]["patientInformation"]["name"]["familyName"]
  end

end
