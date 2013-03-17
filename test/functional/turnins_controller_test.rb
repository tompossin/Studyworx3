require 'test_helper'

class TurninsControllerTest < ActionController::TestCase
  setup do
    @turnin = turnins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turnins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turnin" do
    assert_difference('Turnin.count') do
      post :create, turnin: { assignment_id: @turnin.assignment_id, comment: @turnin.comment, done: @turnin.done, staff_id: @turnin.staff_id, user_id: @turnin.user_id }
    end

    assert_redirected_to turnin_path(assigns(:turnin))
  end

  test "should show turnin" do
    get :show, id: @turnin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turnin
    assert_response :success
  end

  test "should update turnin" do
    put :update, id: @turnin, turnin: { assignment_id: @turnin.assignment_id, comment: @turnin.comment, done: @turnin.done, staff_id: @turnin.staff_id, user_id: @turnin.user_id }
    assert_redirected_to turnin_path(assigns(:turnin))
  end

  test "should destroy turnin" do
    assert_difference('Turnin.count', -1) do
      delete :destroy, id: @turnin
    end

    assert_redirected_to turnins_path
  end
end
