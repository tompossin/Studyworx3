require 'test_helper'

class GradesControllerTest < ActionController::TestCase
  setup do
    @grade = grades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grade" do
    assert_difference('Grade.count') do
      post :create, grade: { assignment_id: @grade.assignment_id, grade: @grade.grade, school_id: @grade.school_id, scratchpad: @grade.scratchpad, staff_comments: @grade.staff_comments, staff_id: @grade.staff_id, student_comments: @grade.student_comments, user_id: @grade.user_id }
    end

    assert_redirected_to grade_path(assigns(:grade))
  end

  test "should show grade" do
    get :show, id: @grade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grade
    assert_response :success
  end

  test "should update grade" do
    put :update, id: @grade, grade: { assignment_id: @grade.assignment_id, grade: @grade.grade, school_id: @grade.school_id, scratchpad: @grade.scratchpad, staff_comments: @grade.staff_comments, staff_id: @grade.staff_id, student_comments: @grade.student_comments, user_id: @grade.user_id }
    assert_redirected_to grade_path(assigns(:grade))
  end

  test "should destroy grade" do
    assert_difference('Grade.count', -1) do
      delete :destroy, id: @grade
    end

    assert_redirected_to grades_path
  end
end
