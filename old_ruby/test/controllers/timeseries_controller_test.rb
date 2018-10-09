require 'test_helper'

class TimeseriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeseries = timeseries(:one)
  end

  test "should get index" do
    get timeseries_index_url
    assert_response :success
  end

  test "should get new" do
    get new_timeseries_url
    assert_response :success
  end

  test "should create timeseries" do
    assert_difference('Timeseries.count') do
      post timeseries_index_url, params: { timeseries: { datetime: @timeseries.datetime, double: @timeseries.double, integer: @timeseries.integer } }
    end

    assert_redirected_to timeseries_url(Timeseries.last)
  end

  test "should show timeseries" do
    get timeseries_url(@timeseries)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeseries_url(@timeseries)
    assert_response :success
  end

  test "should update timeseries" do
    patch timeseries_url(@timeseries), params: { timeseries: { datetime: @timeseries.datetime, double: @timeseries.double, integer: @timeseries.integer } }
    assert_redirected_to timeseries_url(@timeseries)
  end

  test "should destroy timeseries" do
    assert_difference('Timeseries.count', -1) do
      delete timeseries_url(@timeseries)
    end

    assert_redirected_to timeseries_index_url
  end
end
