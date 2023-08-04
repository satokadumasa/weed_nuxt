require "test_helper"

class BoardCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_comment = board_comments(:one)
  end

  test "should get index" do
    get board_comments_url, as: :json
    assert_response :success
  end

  test "should create board_comment" do
    assert_difference('BoardComment.count') do
      post board_comments_url, params: { board_comment: { board_id: @board_comment.board_id, detail: @board_comment.detail, title: @board_comment.title, user_id: @board_comment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show board_comment" do
    get board_comment_url(@board_comment), as: :json
    assert_response :success
  end

  test "should update board_comment" do
    patch board_comment_url(@board_comment), params: { board_comment: { board_id: @board_comment.board_id, detail: @board_comment.detail, title: @board_comment.title, user_id: @board_comment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy board_comment" do
    assert_difference('BoardComment.count', -1) do
      delete board_comment_url(@board_comment), as: :json
    end

    assert_response 204
  end
end
