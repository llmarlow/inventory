class RemoveUserIdFromFlosses < ActiveRecord::Migration
  def change
    remove_column :flosses, :user_id, :integer
  end
end
