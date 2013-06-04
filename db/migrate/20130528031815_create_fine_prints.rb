class CreateFinePrints < ActiveRecord::Migration
  def change
    create_table :fine_prints do |t|
      t.string :description
      t.timestamps
    end
  end
end
