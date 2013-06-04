class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :description
      t.timestamps
    end
  end
end
