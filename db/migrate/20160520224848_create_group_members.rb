class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
    	t.string :g_id
    	t.string :member_username
    end
  end
end
