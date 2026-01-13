Shipment.destroy_all

puts "Creating sample shipments..."

# Calgary to Edmonton - Pending
Shipment.create!(
  origin_lat: 51.0447,
  origin_lng: -114.0719,
  destination_lat: 53.5461,
  destination_lng: -113.4938,
  status: :pending,
)

# Edmonton to Vancouver - In Transit
Shipment.create!(
  origin_lat: 53.5461,
  origin_lng: -113.4938,
  destination_lat: 49.2827,
  destination_lng: -123.1207,
  status: :in_transit,
)

# Vancouver to Calgary - Delivered
Shipment.create!(
  origin_lat: 49.2827,
  origin_lng: -123.1207,
  destination_lat: 51.0447,
  destination_lng: -114.0719,
  status: :delivered,
)

puts "Created #{Shipment.count} shipments!"
