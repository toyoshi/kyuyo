require 'test_helper'

class PayslipsControllerTest < ActionController::TestCase
  setup do
    @payslip = payslips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payslips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payslip" do
    assert_difference('Payslip.count') do
      post :create, payslip: { basic_pay: @payslip.basic_pay, income_tax: @payslip.income_tax, name: @payslip.name, payslip_date: @payslip.payslip_date, transportation_expenses: @payslip.transportation_expenses, work_from: @payslip.work_from, work_to: @payslip.work_to, working_days: @payslip.working_days, working_time: @payslip.working_time }
    end

    assert_redirected_to payslip_path(assigns(:payslip))
  end

  test "should show payslip" do
    get :show, id: @payslip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payslip
    assert_response :success
  end

  test "should update payslip" do
    put :update, id: @payslip, payslip: { basic_pay: @payslip.basic_pay, income_tax: @payslip.income_tax, name: @payslip.name, payslip_date: @payslip.payslip_date, transportation_expenses: @payslip.transportation_expenses, work_from: @payslip.work_from, work_to: @payslip.work_to, working_days: @payslip.working_days, working_time: @payslip.working_time }
    assert_redirected_to payslip_path(assigns(:payslip))
  end

  test "should destroy payslip" do
    assert_difference('Payslip.count', -1) do
      delete :destroy, id: @payslip
    end

    assert_redirected_to payslips_path
  end
end
