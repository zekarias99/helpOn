class CreateUsersDeals < ActiveRecord::Migration
  def change
    create_table :users_deals do |t|
      t.integer :user_id
      t.integer :deal_id
      t.string :promocod
      t.timestamp :used_at

      t.timestamps
    end
  end
end
