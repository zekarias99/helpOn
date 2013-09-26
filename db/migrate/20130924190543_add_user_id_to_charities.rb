class AddUserIdToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :user_id, :integer
    add_index :charities, :user_id
  end
end
