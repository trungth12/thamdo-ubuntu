require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get status" do
    get :status
    assert_response :success
  end

end
