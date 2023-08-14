require "test_helper"

class NoteBookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_bookmark = note_bookmarks(:one)
  end

  test "should get index" do
    get note_bookmarks_url, as: :json
    assert_response :success
  end

  test "should create note_bookmark" do
    assert_difference('NoteBookmark.count') do
      post note_bookmarks_url, params: { note_bookmark: { note_id: @note_bookmark.note_id, user_id: @note_bookmark.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show note_bookmark" do
    get note_bookmark_url(@note_bookmark), as: :json
    assert_response :success
  end

  test "should update note_bookmark" do
    patch note_bookmark_url(@note_bookmark), params: { note_bookmark: { note_id: @note_bookmark.note_id, user_id: @note_bookmark.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy note_bookmark" do
    assert_difference('NoteBookmark.count', -1) do
      delete note_bookmark_url(@note_bookmark), as: :json
    end

    assert_response 204
  end
end
