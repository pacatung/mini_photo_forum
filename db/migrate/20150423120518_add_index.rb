class AddIndex < ActiveRecord::Migration
  def change

    add_column :photos, :user_id, :integer
    add_index :photos, :user_id, :unique => true

    add_index :comments, :user_id
    add_index :comments, :photo_id
  end
end
