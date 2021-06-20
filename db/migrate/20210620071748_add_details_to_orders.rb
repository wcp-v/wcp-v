class AddDetailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :status, :integer
    add_column :orders, :payment_option, :integer
  end
end
