require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get index\" do
    get spa_index\_url
    assert_response :success
  end
end
