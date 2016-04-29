class AddSizeColumnToMenu < ActiveRecord::Migration
  def change
  	add_column :menus, :size, :string
  end
end
