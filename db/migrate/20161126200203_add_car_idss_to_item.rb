class AddCarIdssToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :car_id, :integer
  end
end
