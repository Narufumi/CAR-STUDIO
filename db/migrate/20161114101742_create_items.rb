class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :article_id
      t.integer :item_type
      t.string :title
      t.text :desc
      t.string :image
      t.text :link_url

      t.timestamps null: true
    end
  end
end
