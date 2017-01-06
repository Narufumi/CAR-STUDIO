class ChangeColumnToCondition < ActiveRecord::Migration[5.0]
  def change
    change_column :conditions, :model_year, :string, null: true
    change_column :conditions, :one_owner, :string, null: true
    change_column :conditions, :mileage, :string, null: true
    change_column :conditions, :camper, :string, null: true
    change_column :conditions, :repaired, :string, null: true
    change_column :conditions, :welfare, :string, null: true
    change_column :conditions, :periodic_Inspection_record_book, :string, null: true
    change_column :conditions, :new_property, :string, null: true
    change_column :conditions, :non_smoking, :string, null: true
    change_column :conditions, :regular_imported, :string, null: true
    change_column :conditions, :recycling_fee, :string, null: true
    change_column :conditions, :registered_unused, :string, null: true
    change_column :conditions, :eco_car, :string, null: true
  end
end
