class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, :index => true, :null => false
      t.integer :photo_id, :index => true, :null => false

      t.timestamps null: false
    end
    add_index :subscriptions, [:user_id, :photo_id], :unique => true
  end
end
