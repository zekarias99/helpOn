class ChangeAddressColumnFromTextToStringOnOrders < ActiveRecord::Migration
  def change
  	change_column :orders, :billing_address, :string
  end
end
