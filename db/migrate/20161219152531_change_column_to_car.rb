class ChangeColumnToCar < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :car_name, :string
  end
end
