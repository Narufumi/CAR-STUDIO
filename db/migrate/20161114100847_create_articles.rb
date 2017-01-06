class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.text :desc
      t.string :image
      t.string :item_order
      t.integer :view_count
      t.integer :status

      t.timestamps null: true
    end
  end
end
