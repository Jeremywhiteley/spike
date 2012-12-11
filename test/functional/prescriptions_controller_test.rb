require 'test_helper'

class PrescriptionsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @prescription = prescriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prescriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prescription" do
    assert_difference('Prescription.count') do
      post :create, prescription: { drug_id: @prescription.drug_id, patient_id: @prescription.patient_id, prescriber_id: @prescription.prescriber_id, when_written: @prescription.when_written }
    end

    assert_redirected_to prescription_path(assigns(:prescription))
  end

  test "should show prescription" do
    get :show, id: @prescription
    assert_response :success
  end

  test "should show prescription XML" do
    request.env['HTTP_ACCEPT'] = 'application/xml'
    get :show, id: @prescription
    assert_response :success
    assert_equal "application/xml", response.content_type
    rx = Hash.from_xml response.body
    assert_equal @prescription.id.to_s, rx["medication"]["id"]
  end

  test "should get edit" do
    get :edit, id: @prescription
    assert_response :success
  end

  test "should update prescription" do
    put :update, id: @prescription, prescription: { drug_id: @prescription.drug_id, patient_id: @prescription.patient_id, prescriber_id: @prescription.prescriber_id, when_written: @prescription.when_written }
    assert_redirected_to prescription_path(assigns(:prescription))
  end

  test "should destroy prescription" do
    assert_difference('Prescription.count', -1) do
      delete :destroy, id: @prescription
    end

    assert_redirected_to prescriptions_path
  end
end
