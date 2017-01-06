class RemoveArticleIdsFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :article_id, :integer
  end
end
