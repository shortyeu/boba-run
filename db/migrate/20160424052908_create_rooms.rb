class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_id
      t.string :runner_id
      t.string :room_members_id
      t.string :drink
      t.decimal :price
      t.boolean :drink_purchased
      t.boolean :runner_paid
    end
    add_index :rooms, :room_id
  end
end
