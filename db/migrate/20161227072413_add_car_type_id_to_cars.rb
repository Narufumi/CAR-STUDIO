class AddCarTypeIdToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_type_id, :integer
  end
end
