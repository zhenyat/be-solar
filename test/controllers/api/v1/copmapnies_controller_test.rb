require "test_helper"

class Api::V1::CopmapniesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_copmapnies_show_url
    assert_response :success
  end
end
