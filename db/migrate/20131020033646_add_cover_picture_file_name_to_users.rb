class AddCoverPictureFileNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :cover_picture_file_name,    :string
  	add_column :users, :cover_picture_content_type, :string
  	add_column :users, :cover_picture_file_size,    :integer
  end
end
