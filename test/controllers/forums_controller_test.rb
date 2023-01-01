require "test_helper"

class ForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum = forums(:one)
  end

  test "should get index" do
    get forums_url, as: :json
    assert_response :success
  end

  test "should create forum" do
    assert_difference("Forum.count") do
      post forums_url, params: { forum: { name: @forum.name } }, as: :json
    end

    assert_response :created
  end

  test "should show forum" do
    get forum_url(@forum), as: :json
    assert_response :success
  end

  test "should update forum" do
    patch forum_url(@forum), params: { forum: { name: @forum.name } }, as: :json
    assert_response :success
  end

  test "should destroy forum" do
    assert_difference("Forum.count", -1) do
      delete forum_url(@forum), as: :json
    end

    assert_response :no_content
  end
end
