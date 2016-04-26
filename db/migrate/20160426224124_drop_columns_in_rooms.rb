class DropColumnsInRooms < ActiveRecord::Migration
  def change
  	remove_column :rooms, :room_members_id, :string
  	remove_column :rooms, :drink, :string
  	remove_column :rooms, :price, :decimal
  	remove_column :rooms, :drink_purchased, :boolean
  	remove_column :rooms, :runner_paid, :boolean
  end
end