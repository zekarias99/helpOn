class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :search_name
      t.references :state, index: true

      t.timestamps
    end
  end
end