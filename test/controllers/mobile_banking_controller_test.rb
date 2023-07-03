require "test_helper"

class MobileBankingControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get mobile_banking_welcome_url
    assert_response :success
  end
end
