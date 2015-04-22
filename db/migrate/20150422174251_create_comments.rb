class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :uesr_id
      t.integer :photo_id

      t.timestamps null: false
    end
  end
end
