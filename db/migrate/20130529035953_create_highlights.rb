class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :description
      t.integer :deal_id

      t.timestamps
    end
  end
end
