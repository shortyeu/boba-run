class RemoveSizeColumnFromMenu < ActiveRecord::Migration
  def change
  	remove_column :menus, :size, :string
  end
end
