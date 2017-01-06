class CreateBodyTypeCars < ActiveRecord::Migration[5.0]
  def change
    create_table :body_type_cars do |t|
      t.integer :car_id
      t.integer :body_type_id

      t.timestamps null: true
    end
  end
end
