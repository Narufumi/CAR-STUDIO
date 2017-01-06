class CreateMakers < ActiveRecord::Migration[5.0]
  def change
    create_table :makers do |t|
      t.string :name
      t.integer :category_id

      t.timestamps null: true
    end
  end
end
