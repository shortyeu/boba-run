class CreateGroupTable < ActiveRecord::Migration
  def change
    create_table :group_tables do |t|
    	t.string :g_id
    	t.string :owner_username
    	t.string :group_name
    end
  end
end
