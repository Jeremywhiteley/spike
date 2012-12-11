require 'test_helper'

class SectionsControllerTest < AtomTestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "should get c32_index" do
    get :c32_index, id: @person
    assert_response :success
  end

  test "get c32 index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :c32_index, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 1
  end

  test "should get c32_show" do
    get :c32_show, id: @person
    assert_response :success
  end

  test "should get med_index" do
    get :medication, id: @person
    assert_response :success
  end

  test "get medication index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :medication, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 2
  end

  test "should get med_show" do
    get :medication, id: @person
    assert_response :success
  end

  test "should get demographics" do
    get :demographic, id: @person
    assert_response :success
  end

  test "get demographic Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :demographic, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 1
  end

  test "should get demographic XML" do
    request.env['HTTP_ACCEPT'] = 'application/xml'
    get :demographic, id: @person
    assert_response :success
    assert_equal "application/xml", response.content_type
    demo = Hash.from_xml response.body
    assert_equal @person.name, demo["record"]["patientInformation"]["name"]["familyName"]
  end

end
