class RemoveUserIdFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :user_id, :integer
  end
end
