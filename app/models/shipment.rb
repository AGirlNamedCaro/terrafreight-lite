class Shipment < ApplicationRecord
  broadcasts_to ->(shipment) { "shipments" }, inserts_by: :prepend
  enum :status, [ :pending, :in_transit, :delivered ]

  validates :origin_lat, :origin_lng, :destination_lat, :destination_lng, presence: true
  validates :origin_lat, :destination_lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :origin_lng, :destination_lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def mark_in_transit!
    update!(status: :in_transit)
  end

  def mark_delivered!
    update!(status: :delivered)
  end

  def distance_in_km
    Geocoder::Calculations.distance_between(
      [ origin_lat, origin_lng ],
      [ destination_lat, destination_lng ],
      units: :km,
    ).round(2)
  end
end
