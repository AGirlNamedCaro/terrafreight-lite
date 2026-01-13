require "test_helper"

class ShipmentTest < ActiveSupport::TestCase
  def setup
    @shipment = Shipment.new(
      origin_lat: 51.0447,
      origin_lng: -114.0719,
      destination_lat: 53.5461,
      destination_lng: -113.4938,
    )
  end

  test "should be valid with valid attributes" do
    assert @shipment.valid?
  end

  test "should require origin_lat" do
    @shipment.origin_lat = nil
    assert_not @shipment.valid?
    assert_includes @shipment.errors[:origin_lat], "can't be blank"
  end

  test "should require origin_lng" do
    @shipment.origin_lng = nil
    assert_not @shipment.valid?
  end

  test "should require destination_lat" do
    @shipment.destination_lat = nil
    assert_not @shipment.valid?
  end

  test "should require destination_lng" do
    @shipment.destination_lng = nil
    assert_not @shipment.valid?
  end

  test "should reject invalid latitude values" do
    @shipment.origin_lat = 100
    assert_not @shipment.valid?

    @shipment.origin_lat = -100
    assert_not @shipment.valid?
  end

  test "should reject invalid longitude values" do
    @shipment.origin_lng = 200
    assert_not @shipment.valid?
  end

  test "should default to pending status" do
    assert @shipment.pending?
  end

  test "should transition to in_transit" do
    @shipment.save!
    @shipment.mark_in_transit!
    assert @shipment.in_transit?
  end

  test "should transition to delivered" do
    @shipment.save!
    @shipment.mark_delivered!
    assert @shipment.delivered?
  end

  test "should calculate distance between Calgary and Edmonton" do
    @shipment.save!
    distance = @shipment.distance_in_km

    assert distance > 280
    assert distance < 310
  end
end
