class AddBooleanDefaultValueFalseToDeal < ActiveRecord::Migration
  def change
  	change_column :deals, :approved, :boolean, default: false
  end
end
