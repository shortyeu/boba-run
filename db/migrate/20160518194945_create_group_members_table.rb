class CreateGroupMembersTable < ActiveRecord::Migration
  def change
    create_table :group_members_tables do |t|
    	t.string :g_id
    	t.string :member_username
    end
  end
end