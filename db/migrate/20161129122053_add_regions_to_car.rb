class AddRegionsToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :region, :string
    add_column :cars, :district, :string
    add_column :cars, :store_name, :string
  end
end
