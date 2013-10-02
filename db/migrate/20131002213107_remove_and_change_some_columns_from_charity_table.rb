class RemoveAndChangeSomeColumnsFromCharityTable < ActiveRecord::Migration
  def change

  	remove_column :charities, :registered_charity_number
  	remove_column :charities, :first_name
  	remove_column :charities, :last_name
  	remove_column :charities, :job_title
  	remove_column :charities, :email_address
  	remove_column :charities, :telephone_number
  	add_column    :charities, :registered_charity_number, :integer
  end
end
