class ChangeBasePriceToCar < ActiveRecord::Migration[5.0]
  def change
    change_column :cars, :base_price, :string, null: true
    change_column :cars, :total_price, :string, null: true
    change_column :cars, :model_year, :string, null: true
    change_column :cars, :mileage, :string, null: true
    change_column :cars, :displacement, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :repaired, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    change_column :cars, :vehicle_inspection, :string, null: true
    remove_column :cars, :image, :string
  end
end
