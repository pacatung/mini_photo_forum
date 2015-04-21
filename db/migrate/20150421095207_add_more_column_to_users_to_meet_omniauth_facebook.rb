class AddMoreColumnToUsersToMeetOmniauthFacebook < ActiveRecord::Migration
  def change

    add_column :users, :fb_uid, :string
    add_column :users, :image, :string
    add_column :users, :fb_token, :string
    add_column :users, :fb_expires_at, :datetime

    add_index :users, :fb_uid, :unique => true
  end
end
