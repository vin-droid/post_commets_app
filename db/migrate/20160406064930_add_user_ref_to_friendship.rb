class AddUserRefToFriendship < ActiveRecord::Migration
  def change
    add_reference :friendships, :user, index: true, foreign_key: true
  end
end
