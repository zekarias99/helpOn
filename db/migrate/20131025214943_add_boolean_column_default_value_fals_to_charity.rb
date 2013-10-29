class AddBooleanColumnDefaultValueFalsToCharity < ActiveRecord::Migration
  def change
  	change_column :charities, :i_agree_to_the, :boolean, default: false
  end
end
