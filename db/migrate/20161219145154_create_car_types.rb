class CreateCarTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :car_types do |t|
      t.string :name
      t.integer :maker_id

      t.timestamps null: true
    end
  end
end
