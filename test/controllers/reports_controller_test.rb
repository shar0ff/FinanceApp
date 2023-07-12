require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  def setup
    @start_date = '2022-01-01'
    @end_date = '2023-01-31'
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get report by category' do
    get :report_by_category, params: { startDate: @start_date, endDate: @end_date }
    assert_response :success

    assert_not_nil assigns(:categories_by_c)
    assert_not_nil assigns(:amount_by_c)
  end

  test 'should get report by dates' do
    get :report_by_dates, params: { startDate: @start_date, endDate: @end_date }
    assert_response :success

    assert_not_nil assigns(:dates_by_d)
    assert_not_nil assigns(:amounts_by_d)
  end
end
