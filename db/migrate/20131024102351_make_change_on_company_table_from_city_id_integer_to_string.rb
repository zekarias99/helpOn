class MakeChangeOnCompanyTableFromCityIdIntegerToString < ActiveRecord::Migration
  def change
  	change_column :companies, :city_id,  :string
  end
end
