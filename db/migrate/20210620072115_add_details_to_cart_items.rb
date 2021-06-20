class AddDetailsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :item_id, :integer
    add_column :cart_items, :user_id, :integer
  end
end
