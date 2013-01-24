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
    assert_equal 4, assigns(:people).size
  end

  test "should constrain index based on search params" do
    get :index, "search" => "One"
    assert_response :success
    assert_not_nil assigns(:people)
    assert_equal 1, assigns(:people).size
    get :index, "search" => "TestPatient"
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
      post :create, person: { family_name: @person.family_name, sex_id: sexes(:UNK).id }
    end
    assert_nil assigns(:person).address

    assert_redirected_to person_path(assigns(:person))
  end

  test "should create person with address" do
    assert_difference('Person.count') do
      post :create, person: { family_name: @person.family_name, sex_id: sexes(:UNK).id, address_attributes: { postal_code: "12345" } }
    end
    assert_equal "12345", assigns(:person).address.postal_code

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

  test "should update person without an address" do
    @person = people(:two) # person two has no address
    put :update, id: @person, person: { family_name: @person.family_name }
    assert_redirected_to person_path(assigns(:person))
    assert_nil assigns(:person).address
  end

  test "should update person with an address" do
    put :update, id: @person, person: { family_name: @person.family_name, address_attributes: { postal_code: "TEST" }  }
    assert_redirected_to person_path(assigns(:person))
    assert_equal "TEST", assigns(:person).address.postal_code
  end

  test "should add an address to a person that didn't have one" do
    @person = people(:two) # person two has no address
    put :update, id: @person, person: { family_name: @person.family_name, address_attributes: { postal_code: "TEST" }  }
    assert_redirected_to person_path(assigns(:person))
    assert_equal "TEST", assigns(:person).address.postal_code
  end

  test "should remove an address from a person that had one" do
    @person = people(:one)
    put :update, id: @person, person: { family_name: @person.family_name, address_attributes: { street: "", city: "", state: "", postal_code: "" }  }
    assert_redirected_to person_path(assigns(:person))
    assert_nil assigns(:person).address
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
    assert_atom_result_count rss, 4
  end

  test "get person root Atom feed" do
    request.env['HTTP_ACCEPT'] = 'application/atom+xml'
    get :show, id: @person
    assert_atom_success
    assert_atom_result_count atom_results, 1
  end

  test "get person hData root.xml" do
    request.env['HTTP_ACCEPT'] = 'application/xml'
    get :hdata_root, id: @person
    assert_response :success
  end

end
