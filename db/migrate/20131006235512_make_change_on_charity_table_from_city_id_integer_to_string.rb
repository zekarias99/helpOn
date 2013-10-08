class MakeChangeOnCharityTableFromCityIdIntegerToString < ActiveRecord::Migration
  def change
  	change_column :charities, :city_id,  :string
  end
end
