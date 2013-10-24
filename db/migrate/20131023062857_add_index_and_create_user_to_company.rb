class AddIndexAndCreateUserToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :user_id, :integer
  	add_index :companies, :created_at
    add_index :companies, :user_id
  end
end
