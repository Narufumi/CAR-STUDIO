class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.decimal :base_price
      t.decimal :total_price
      t.integer :model_year
      t.decimal :mileage
      t.decimal :displacement
      t.timestamp :vehicle_inspection
      t.integer :repaired
      t.text :url
      t.integer :maker_id

      t.timestamps null: true
    end
  end
end
