require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "should get c32_index" do
    get :c32_index, id: @person
    assert_response :success
  end

  test "should get c32_show" do
    get :c32_show, id: @person
    assert_response :success
  end

  test "should get med_index" do
    get :med_index, id: @person
    assert_response :success
  end

  test "should get med_show" do
    get :med_show, id: @person
    assert_response :success
  end

  test "should get demo_index" do
    get :demo_index, id: @person
    assert_response :success
  end

  test "should get demo_show" do
    get :demo_show, id: @person
    assert_response :success
  end

end
