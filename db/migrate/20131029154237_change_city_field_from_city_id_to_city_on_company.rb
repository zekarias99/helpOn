class ChangeCityFieldFromCityIdToCityOnCompany < ActiveRecord::Migration
  def change
  change_column :companies, :city,  :string 
  end
end
