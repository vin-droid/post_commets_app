class AddColumnToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :block, :string
  end
end
