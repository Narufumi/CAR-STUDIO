class CreateCarImages < ActiveRecord::Migration[5.0]
  def change
    create_table :car_images do |t|
      t.text :url
      t.integer :car_id

      t.timestamps null: true
    end
  end
end
