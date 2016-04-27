class RenameColumnNameFromFriendship < ActiveRecord::Migration
  def change
  	rename_column :friendships ,:user_id ,:friendable_id
  	rename_column :friendships ,:is_accepted ,:pending
  end
end
