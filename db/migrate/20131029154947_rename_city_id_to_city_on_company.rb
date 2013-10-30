class RenameCityIdToCityOnCompany < ActiveRecord::Migration
  def change
  	rename_column(:companies, :city_id, :city)
  end
end
