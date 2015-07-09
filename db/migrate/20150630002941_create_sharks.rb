class CreateSharks < ActiveRecord::Migration
  def change
    create_table :sharks do |t|
      t.string :common_name
      t.string :latin_name
      t.string :habitat_range
      t.integer :attacks_on_humans
      t.boolean :suitability_as_pet

      t.timestamps null: false
    end
  end
end
