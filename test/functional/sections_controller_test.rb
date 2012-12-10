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
    get :med_index, id: @person
    assert_response :success
  end

  test "get medication index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :med_index, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 1
  end

  test "should get med_show" do
    get :med_show, id: @person
    assert_response :success
  end

  test "should get demo_index" do
    get :demo_index, id: @person
    assert_response :success
  end

  test "get demographic index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :demo_index, id: @person
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 1
  end

  test "should get demo_show" do
    get :demo_show, id: @person
    assert_response :success
  end

end
