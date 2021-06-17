class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :shipping_cost
      t.integer :total_payment

      t.timestamps
    end
  end
end
