class AddMoreFieldsToCharity < ActiveRecord::Migration
  def change
  	add_column :charities, :goal_amount, :decimal
  	add_column :charities, :raising_ends_on, :date
  end
end
