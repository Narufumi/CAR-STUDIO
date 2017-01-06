class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.integer :model_year
      t.integer :one_owner
      t.decimal :mileage
      t.integer :camper
      t.integer :repaired
      t.integer :welfare
      t.integer :periodic_Inspection_record_book
      t.integer :new_property
      t.integer :non_smoking
      t.integer :regular_imported
      t.string :recycling_fee
      t.integer :registered_unused
      t.integer :eco_car
      t.string :inspection
      t.string :statutory_maintenance
      t.string :security
      t.integer :car_id

      t.timestamps null: true
    end
  end
end
