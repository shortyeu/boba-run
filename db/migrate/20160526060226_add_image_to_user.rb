class AddImageToUser < ActiveRecord::Migration
  def change
  	add_column :users, :image, :string
  	add_column :groups, :image, :string
  end
end
