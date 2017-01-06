require 'test_helper'

class CarNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_names_index_url
    assert_response :success
  end

  test "should get show" do
    get car_names_show_url
    assert_response :success
  end

end
