class AddNametoRoomsTable < ActiveRecord::Migration
  def change
  	add_column :rooms, :room_name, :string
  end
end

