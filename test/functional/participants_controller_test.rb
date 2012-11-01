require 'test_helper'

class ParticipantsControllerTest < ActionController::TestCase
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post :create, participant: { accepted: @participant.accepted, avatar: @participant.avatar, language_id: @participant.language_id, prereq: @participant.prereq, role_id: @participant.role_id, school_id: @participant.school_id, theme: @participant.theme, user_id: @participant.user_id, wallpaper: @participant.wallpaper }
    end

    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should show participant" do
    get :show, id: @participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participant
    assert_response :success
  end

  test "should update participant" do
    put :update, id: @participant, participant: { accepted: @participant.accepted, avatar: @participant.avatar, language_id: @participant.language_id, prereq: @participant.prereq, role_id: @participant.role_id, school_id: @participant.school_id, theme: @participant.theme, user_id: @participant.user_id, wallpaper: @participant.wallpaper }
    assert_redirected_to participant_path(assigns(:participant))
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete :destroy, id: @participant
    end

    assert_redirected_to participants_path
  end
end
