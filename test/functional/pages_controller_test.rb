require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get confirm_email" do
    get :confirm_email
    assert_response :success
  end

end
