class AddCardholderNameBillingAddressCityCardNumberSecurityCodToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :card_number, :integer
  	add_column :orders, :security_code, :integer
  	add_column :orders, :expiration_date, :integer
  	add_column :orders, :postal_code, :integer
  end
end
