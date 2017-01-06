class CreateBodyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :body_types do |t|
      t.string :name
      t.integer :category_id

      t.timestamps null: true
    end
  end
end
