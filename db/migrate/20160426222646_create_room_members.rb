class CreateRoomMembers < ActiveRecord::Migration
  def change
    create_table :room_members do |t|
      t.string :room_id
      t.string :room_members_id
      t.string :drink
      t.decimal :price
      t.boolean :drink_purchased
      t.boolean :runner_paid
    end
    add_index :room_members, :room_id
  end
end
