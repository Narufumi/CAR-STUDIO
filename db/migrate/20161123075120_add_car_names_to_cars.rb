class AddCarNamesToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :car_name, :string
  end
end
