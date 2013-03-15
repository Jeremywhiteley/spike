require 'test_helper'

class SectionsControllerTest < AtomTestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "get srpp index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :srpp, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 4
  end

  test "get ccda full report XML" do
    request.env['HTTP_ACCEPT'] = 'application/vnd.mitre.pdmp.2+xml'
    get :report, id: @person
    assert_response :success
    assert_equal "application/vnd.mitre.pdmp.2+xml", response.content_type
    demo = Hash.from_xml response.body
    assert_equal @person.family_name, demo["record"]["patientInformation"]["name"]["familyName"]
    assert_equal @person.sex.code, demo["record"]["patientInformation"]["gender"]
  end

  test "get demographic XML" do
    request.env['HTTP_ACCEPT'] = 'application/vnd.mitre.pdmp.2+xml'
    get :demographic, id: @person
    assert_response :success
    assert_equal "application/vnd.mitre.pdmp.2+xml", response.content_type
    demo = Hash.from_xml response.body
    assert_equal @person.family_name, demo["patientInformation"]["name"]["familyName"]
    assert_equal @person.sex.code, demo["patientInformation"]["gender"]
  end

  test "get ncpdp report XML" do
    request.env['HTTP_ACCEPT'] = 'application/vnd.ncpdp.script.10+xml'
    get :report, id: @person
    assert_response :success
    assert_equal "application/vnd.ncpdp.script.10+xml", response.content_type
    demo = Hash.from_xml response.body
  end

end
