class RenameCiyiIdToCityOnCharityTable < ActiveRecord::Migration
  def change
  	rename_column(:charities, :city_id, :city) 
  end
end
