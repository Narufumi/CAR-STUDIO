class AddDescsToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :name, :string
    add_column :cars, :desc, :text
    add_column :cars, :image, :string
    add_column :cars, :item_order, :string
    add_column :cars, :status, :integer
    add_column :cars, :user_id, :integer
  end
end
