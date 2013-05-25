require 'test_helper'

class WhiteboardsControllerTest < ActionController::TestCase
  setup do
    @whiteboard = whiteboards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whiteboards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whiteboard" do
    assert_difference('Whiteboard.count') do
      post :create, whiteboard: { content: @whiteboard.content, content_type: @whiteboard.content_type, school_id: @whiteboard.school_id, user_id: @whiteboard.user_id }
    end

    assert_redirected_to whiteboard_path(assigns(:whiteboard))
  end

  test "should show whiteboard" do
    get :show, id: @whiteboard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whiteboard
    assert_response :success
  end

  test "should update whiteboard" do
    put :update, id: @whiteboard, whiteboard: { content: @whiteboard.content, content_type: @whiteboard.content_type, school_id: @whiteboard.school_id, user_id: @whiteboard.user_id }
    assert_redirected_to whiteboard_path(assigns(:whiteboard))
  end

  test "should destroy whiteboard" do
    assert_difference('Whiteboard.count', -1) do
      delete :destroy, id: @whiteboard
    end

    assert_redirected_to whiteboards_path
  end
end
