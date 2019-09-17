require 'test_helper'

class TestReactCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_react_codes_index_url
    assert_response :success
  end

end
