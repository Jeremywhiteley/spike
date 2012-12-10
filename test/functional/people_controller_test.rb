require 'test_helper'
require 'atom_test'

class PeopleControllerTest < AtomTestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal 2, assigns(:people).size
  end

  test "should constrain index based on search params" do
    get :index, "search" => "One"
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal 1, assigns(:people).size
    get :index, "search" => "My"
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal 2, assigns(:people).size
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { name: @person.name }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: { name: @person.name }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end

  test "get records index Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :index
    assert_atom_success
    rss = atom_results
    assert_atom_result_count rss, 2
  end

  test "get person root Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :show, id: @person
    assert_atom_success
    assert_atom_result_count atom_results, 3
  end

end
