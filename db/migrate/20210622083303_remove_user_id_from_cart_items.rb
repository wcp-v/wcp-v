class RemoveUserIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :UserId, :integer
  end
end
