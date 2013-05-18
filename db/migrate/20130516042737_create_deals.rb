class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.integer :regular_price
      t.integer :initial_discount
      t.integer :max_discount
      t.integer :max_threshold
      t.boolean :approved
      t.date :deal_date
      t.string :photo_file_name
      t.string :blurb_title
      t.text :blurb
      t.string :deal_type
      t.integer :tipping_point
      t.date :end_date

      t.timestamps
    end
  end
end
