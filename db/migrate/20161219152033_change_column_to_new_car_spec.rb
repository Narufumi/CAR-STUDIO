class ChangeColumnToNewCarSpec < ActiveRecord::Migration[5.0]
  def change
    change_column :new_car_specs, :wheelbase, :string, null: true
    change_column :new_car_specs, :seat_num, :string, null: true
    change_column :new_car_specs, :fuel_jc08, :string, null: true
    change_column :new_car_specs, :turning_radius, :string, null: true
    change_column :new_car_specs, :fuel_1015, :string, null: true

  end
end
