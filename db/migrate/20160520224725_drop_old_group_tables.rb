class DropOldGroupTables < ActiveRecord::Migration
  def change
  	drop_table :group_members_tables
  	drop_table :group_tables
  end
end
