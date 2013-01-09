require 'test_helper'

class MetadataFetchTest < ActionDispatch::IntegrationTest

  test "fetch hdata metadata" do
    sign_in

    # get people atom feed
    get "/people", {}, "HTTP_ACCEPT" => 'application/atom+xml'
    assert_response :success

    # follow it to person one's root.xml
    index_feed = Hash.from_xml response.body
    assert_equal 3, index_feed["feed"]["entry"].size
    person_root_path = index_feed["feed"]["entry"].select{|h|h["title"]=="Mr TestPatient One"}[0]["link"].select{|h|h["rel"]=="root"}[0]["href"]
    get person_root_path
    assert_response :success
    person_root = Nokogiri::XML response.body
    assert_equal 2, person_root.xpath("//xmlns:extension").size

    # get the demographic RDDL web page
    demographic_path = person_root.xpath("//xmlns:extension[1]").text
    get demographic_path, {}
    assert_response :success

    # get demographic XML schema
    demographic_rddl = Nokogiri::HTML response.body
    demographic_schema_path = person_root.xpath("//xmlns:resource/@xlink:href", "xmlns" => "http://www.rddl.org/", "xlink" => "http://www.w3.org/1999/xlink").text
    get demographic_schema_path
    assert_response :success

    # get the medication RDDL web page
    medication_path = person_root.xpath("//xmlns:extension[2]").text
    get medication_path, {}
    assert_response :success

    # get medication XML schema
    medication_rddl = Nokogiri::HTML response.body
    medication_schema_path = person_root.xpath("//xmlns:resource/@xlink:href", "xmlns" => "http://www.rddl.org/", "xlink" => "http://www.w3.org/1999/xlink").text
    get medication_schema_path
    assert_response :success

  end

end
