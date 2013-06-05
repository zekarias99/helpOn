class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :zip_code

      t.timestamps
    end
  end
end
