require "test_helper"

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment = shipments(:pending_shipment)
  end

  test "should get index" do
    get shipments_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_url
    assert_response :success
  end

  test "should create shipment" do
    assert_difference("Shipment.count", 1) do
      post shipments_url, params: {
                            shipment: {
                              origin_lat: 51.0447,
                              origin_lng: -114.0719,
                              destination_lat: 49.2827,
                              destination_lng: -123.1207
                            }
                          }
    end

    assert_redirected_to shipments_path
  end

  test "should not create invalid shipment" do
    assert_no_difference("Shipment.count") do
      post shipments_url, params: {
                            shipment: {
                              origin_lat: nil,
                              origin_lng: -114.0719,
                              destination_lat: 49.2827,
                              destination_lng: -123.1207
                            }
                          }
    end

    assert_response :unprocessable_entity
  end

  test "should get edit" do
    get edit_shipment_url(@shipment)
    assert_response :success
  end

  test "should update shipment" do
    patch shipment_url(@shipment), params: {
                                     shipment: {
                                       origin_lat: 45.5017
                                     }
                                   }

    assert_equal 45.5017, @shipment.reload.origin_lat
  end

  test "should not update with invalid attributes" do
    patch shipment_url(@shipment), params: {
                                     shipment: {
                                       origin_lat: nil
                                     }
                                   }

    assert_response :unprocessable_entity
  end

  test "should destroy shipment" do
    assert_difference("Shipment.count", -1) do
      delete shipment_url(@shipment)
    end

    assert_redirected_to shipments_url
  end
end
