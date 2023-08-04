require "test_helper"

class PageCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page_comment = page_comments(:one)
  end

  test "should get index" do
    get page_comments_url, as: :json
    assert_response :success
  end

  test "should create page_comment" do
    assert_difference('PageComment.count') do
      post page_comments_url, params: { page_comment: { detail: @page_comment.detail, page_id: @page_comment.page_id, title: @page_comment.title, user_id: @page_comment.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show page_comment" do
    get page_comment_url(@page_comment), as: :json
    assert_response :success
  end

  test "should update page_comment" do
    patch page_comment_url(@page_comment), params: { page_comment: { detail: @page_comment.detail, page_id: @page_comment.page_id, title: @page_comment.title, user_id: @page_comment.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy page_comment" do
    assert_difference('PageComment.count', -1) do
      delete page_comment_url(@page_comment), as: :json
    end

    assert_response 204
  end
end
