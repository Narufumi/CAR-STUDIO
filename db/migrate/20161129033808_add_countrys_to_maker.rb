class AddCountrysToMaker < ActiveRecord::Migration[5.0]
  def change
    add_column :makers, :country, :string
  end
end
