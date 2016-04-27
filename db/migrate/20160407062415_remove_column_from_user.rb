class RemoveColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :user_name, :string
  end
end
