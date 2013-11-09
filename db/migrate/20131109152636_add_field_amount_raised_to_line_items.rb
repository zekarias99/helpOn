class AddFieldAmountRaisedToLineItems < ActiveRecord::Migration
  def change
  	add_column :line_items, :amount_raised, :decimal
  end
end
