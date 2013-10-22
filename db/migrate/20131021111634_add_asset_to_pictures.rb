class AddAssetToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :asset,               :string
  end
end
