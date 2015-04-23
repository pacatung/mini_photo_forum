class AddIndex < ActiveRecord::Migration
  def change

    add_column :photos, :uesr_id, :integer
    add_index :photos, :uesr_id, :unique => true

    add_index :comments, :uesr_id
    add_index :comments, :photo_id
  end
end
