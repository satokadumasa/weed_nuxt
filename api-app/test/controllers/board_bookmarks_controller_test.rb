require "test_helper"

class BoardBookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_bookmark = board_bookmarks(:one)
  end

  test "should get index" do
    get board_bookmarks_url, as: :json
    assert_response :success
  end

  test "should create board_bookmark" do
    assert_difference('BoardBookmark.count') do
      post board_bookmarks_url, params: { board_bookmark: { board_id: @board_bookmark.board_id, user_id: @board_bookmark.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show board_bookmark" do
    get board_bookmark_url(@board_bookmark), as: :json
    assert_response :success
  end

  test "should update board_bookmark" do
    patch board_bookmark_url(@board_bookmark), params: { board_bookmark: { board_id: @board_bookmark.board_id, user_id: @board_bookmark.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy board_bookmark" do
    assert_difference('BoardBookmark.count', -1) do
      delete board_bookmark_url(@board_bookmark), as: :json
    end

    assert_response 204
  end
end
