class ChangeSecurityTitleOfConditions < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :security, :text, null: true
  end
end
