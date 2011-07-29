require 'test_helper'

class LeaveDefinationsControllerTest < ActionController::TestCase
  setup do
    @leave_defination = leave_definations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leave_definations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leave_defination" do
    assert_difference('LeaveDefination.count') do
      post :create, :leave_defination => @leave_defination.attributes
    end

    assert_redirected_to leave_defination_path(assigns(:leave_defination))
  end

  test "should show leave_defination" do
    get :show, :id => @leave_defination.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @leave_defination.to_param
    assert_response :success
  end

  test "should update leave_defination" do
    put :update, :id => @leave_defination.to_param, :leave_defination => @leave_defination.attributes
    assert_redirected_to leave_defination_path(assigns(:leave_defination))
  end

  test "should destroy leave_defination" do
    assert_difference('LeaveDefination.count', -1) do
      delete :destroy, :id => @leave_defination.to_param
    end

    assert_redirected_to leave_definations_path
  end
end
