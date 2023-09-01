require "test_helper"

class VchatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vchat = vchats(:one)
  end

  test "should get index" do
    get vchats_url, as: :json
    assert_response :success
  end

  test "should create vchat" do
    assert_difference("Vchat.count") do
      post vchats_url, params: { vchat: { name: @vchat.name, orverview: @vchat.orverview, user_id: @vchat.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show vchat" do
    get vchat_url(@vchat), as: :json
    assert_response :success
  end

  test "should update vchat" do
    patch vchat_url(@vchat), params: { vchat: { name: @vchat.name, orverview: @vchat.orverview, user_id: @vchat.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy vchat" do
    assert_difference("Vchat.count", -1) do
      delete vchat_url(@vchat), as: :json
    end

    assert_response :no_content
  end
end
