class AddColumnToLike < ActiveRecord::Migration
  def change

    add_column :likes, :photo_id, :integer
    add_column :likes, :user_id, :integer
    add_column :photos, :likes_count, :integer, :default => 0

    add_index :likes, [:photo_id, :user_id], :unique => true

  end
end
