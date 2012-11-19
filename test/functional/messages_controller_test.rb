require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: { archived: @message.archived, body: @message.body, has_read: @message.has_read, parent_id: @message.parent_id, recipient_id: @message.recipient_id, recipient_trashed: @message.recipient_trashed, school_id: @message.school_id, sender_id: @message.sender_id, sender_trashed: @message.sender_trashed, subject: @message.subject }
    end

    assert_redirected_to message_path(assigns(:message))
  end

  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  test "should update message" do
    put :update, id: @message, message: { archived: @message.archived, body: @message.body, has_read: @message.has_read, parent_id: @message.parent_id, recipient_id: @message.recipient_id, recipient_trashed: @message.recipient_trashed, school_id: @message.school_id, sender_id: @message.sender_id, sender_trashed: @message.sender_trashed, subject: @message.subject }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
