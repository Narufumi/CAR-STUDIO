class ChangeColumnToSpec < ActiveRecord::Migration[5.0]
  def change
    change_column :specs, :last_number, :string, null: true
    change_column :specs, :displacement, :string, null: true
    change_column :specs, :passenger_capacity, :string, null: true
    change_column :specs, :door, :string, null: true
  end
end
