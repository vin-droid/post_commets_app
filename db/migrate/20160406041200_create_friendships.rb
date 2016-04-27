class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer  :friend_id
      t.integer  :user_id
      t.boolean  :is_accepted
      t.timestamps null: false
    end
  end
end
