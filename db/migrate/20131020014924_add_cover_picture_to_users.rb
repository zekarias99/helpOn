class AddCoverPictureToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :cover_picture, :string
  end
end
