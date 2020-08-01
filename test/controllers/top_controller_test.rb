require 'test_helper'

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get top_hello_url
    assert_response :success
  end

end
