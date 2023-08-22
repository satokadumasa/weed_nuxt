require "test_helper"

class UserRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_room = user_rooms(:one)
  end

  test "should get index" do
    get user_rooms_url, as: :json
    assert_response :success
  end

  test "should create user_room" do
    assert_difference('UserRoom.count') do
      post user_rooms_url, params: { user_room: { room_id: @user_room.room_id, user_id: @user_room.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_room" do
    get user_room_url(@user_room), as: :json
    assert_response :success
  end

  test "should update user_room" do
    patch user_room_url(@user_room), params: { user_room: { room_id: @user_room.room_id, user_id: @user_room.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_room" do
    assert_difference('UserRoom.count', -1) do
      delete user_room_url(@user_room), as: :json
    end

    assert_response 204
  end
end
