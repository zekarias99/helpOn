class RenameAvatarFileNameColumnToAvatarInUsersTable < ActiveRecord::Migration
  def change
  rename_column(:users, :avatar_file_name, :avatar)  
  end
end
