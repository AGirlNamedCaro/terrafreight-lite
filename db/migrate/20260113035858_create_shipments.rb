class CreateShipments < ActiveRecord::Migration[8.0]
  def change
    create_table :shipments do |t|
      t.decimal :origin_lat, precision: 10, scale: 4
      t.decimal :origin_lng, precision: 10, scale: 4
      t.decimal :destination_lat, precision: 10, scale: 4
      t.decimal :destination_lng, precision: 10, scale: 4
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
