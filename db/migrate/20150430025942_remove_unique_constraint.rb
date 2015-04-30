class RemoveUniqueConstraint < ActiveRecord::Migration
  def change

    remove_index :photos, :user_id
    add_index :photos, :user_id
  end

end
