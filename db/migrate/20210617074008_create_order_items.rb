class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :count
      t.integer :price

      t.timestamps
    end
  end
end
