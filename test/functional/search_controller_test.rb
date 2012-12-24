require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @person = people(:one)
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
