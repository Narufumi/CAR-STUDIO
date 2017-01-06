class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :car_id

      t.timestamps null: true
    end
  end
end