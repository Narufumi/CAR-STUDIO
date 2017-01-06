class CreateSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :specs do |t|
      t.string :body_type
      t.string :drive_system
      t.string :color
      t.string :handle
      t.integer :last_number
      t.string :mission
      t.integer :displacement
      t.integer :passenger_capacity
      t.string :engine_type
      t.integer :door
      t.integer :car_id

      t.timestamps null: true
    end
  end
end
