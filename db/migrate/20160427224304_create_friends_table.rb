class CreateFriendsTable < ActiveRecord::Migration
  def change
  	create_table :friends do |t|
  	  t.string :user_id
      t.string :friend_id

      t.timestamps
    end
    add_index :friends, :user_id
  end

end
