class AddIndexCreatedAtToAlbemTable < ActiveRecord::Migration
  def change
  	add_index :albums, :created_at
  end
end
