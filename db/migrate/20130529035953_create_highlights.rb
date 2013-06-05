class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :description
      t.references :deal, index: true
      t.timestamps
    end
  end
end
