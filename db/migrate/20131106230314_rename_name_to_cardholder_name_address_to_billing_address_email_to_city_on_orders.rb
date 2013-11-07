class RenameNameToCardholderNameAddressToBillingAddressEmailToCityOnOrders < ActiveRecord::Migration
  def change
  	rename_column(:orders, :name, :cardholder_name)
  	rename_column(:orders, :email, :city)
  	rename_column(:orders, :address, :billing_address)
  	rename_column(:orders, :pay_type, :state)
  end
end
