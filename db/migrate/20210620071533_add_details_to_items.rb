class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :is_active, :boolean
  end
end
