class CreateNewCarSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :new_car_specs do |t|
      t.string :release_date
      t.integer :wheelbase
      t.string :body_dimension
      t.string :used_fuel
      t.integer :seat_num
      t.string :vehicle_weight
      t.string :indoor
      t.string :drive_system
      t.integer :fuel_jc08
      t.decimal :turning_radius
      t.integer :fuel_1015
      t.integer :car_id

      t.timestamps null: true
    end
  end
end
